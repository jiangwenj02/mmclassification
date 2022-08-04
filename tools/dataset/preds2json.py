import os
import os.path as osp
import imageio
import pandas as pd
import datetime
from collections import defaultdict
import json
import numpy as np
from tqdm import tqdm
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib as mpl
import multiprocessing
import cv2
import torch
from pathlib import Path
import mmcv
import time
from mmcls.apis import init_model, inference_model
import glob
class Evaluator:
    def __init__(self, opt):

        self.opt = opt
        self.saving_root = opt.save_path
        self.image_root = opt.image_path
        self.ids = ["0004899724", "0005065103", "0005963043", "0006538238", "20120319_051", "20201012_154", "20201110_099", "20201110_099", "20201117_101", "20201117_101", "20210219_030"]
        os.popen('rm -r ' + osp.join(self.saving_root, '*'))
        os.makedirs(self.saving_root, exist_ok=True)

    def _init_detector(self):
        self.device = self.opt.device
        # Load model
        model = init_model(self.opt.config, checkpoint=self.opt.weights, device='cpu')
        self.names = model.CLASSES
        self.model = model.to(self.device)

    def test_images(self):
        self._init_detector()

        for id in self.ids:
            healthy = {}
            for filename in glob.iglob(osp.join(self.image_root, 'healthy', id, '**/*.jpg'), recursive = True):
                img = mmcv.imread(filename)
                result = inference_model(self.model, img)
                healthy[filename.split('/')[-1].replace('.jpg', '')] = result['pred_label']
            json_name = osp.join(self.saving_root, '{}_healthy.json'.format(id))
            mmcv.dump(healthy, json_name)

        for id in self.ids:
            results = {}
            for filename in glob.iglob(osp.join(self.image_root, 'disease', id, '**/*.jpg'), recursive = True):
                img = mmcv.imread(filename)
                result = inference_model(self.model, img)
                results[filename.split('/')[-1].replace('.jpg', '')] = result['pred_label']
            json_name = osp.join(self.saving_root, '{}_{}.json'.format(id, filename.replace(osp.join(self.image_root, 'disease', id), '').split('/')[1]))
            mmcv.dump(results, json_name) 

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description="video_evaluation")
    parser.add_argument('--image_path', type=str, default='/data2/dataset/XY_Capsule/Video_Image_Cases', help='source')  # file/folder, 0 for webcam
    parser.add_argument('--save_path', type=str, default='/data3/zzhang/tmp/gastro_cancer_0901/', help='source')  # file/folder, 0 for webcam
    parser.add_argument('--config', nargs='+', type=str, default='/data3/zzhang/mmclassification/configs/diseased/resnet50_cancer.py', help='model.pt path(s)')
    parser.add_argument('--weights', nargs='+', type=str, default='/data3/zzhang/mmclassification/work_dirs/resnet50_cancer/latest.pth', help='model.pt path(s)')
    parser.add_argument('--device', default='cuda:0', help='cuda device, i.e. 0 or 0,1,2,3 or cpu')
    args = parser.parse_args()
    evaluator = Evaluator(args)
    evaluator.test_images()