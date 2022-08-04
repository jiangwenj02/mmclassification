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
import argparse
import torch
from pathlib import Path
import mmcv
import time
from mmcls.apis import init_model, inference_model
import glob
import os.path as osp
import shutil

if __name__ == '__main__':
    
    parser = argparse.ArgumentParser(description="video_evaluation")
    parser.add_argument('--images_path', type=str, default='/data2/dataset/XY_Capsule/Video_Image_Cases', help='source')  # file/folder, 0 for webcam
    parser.add_argument('--save_path', type=str, default='/data3/zzhang/tmp/XY_Capsule/Video_Image_Cases_binary', help='source')  # file/folder, 0 for webcam
    parser.add_argument('--cls_idx', type=int, default=0)  # file/folder, 0 for webcam
    args = parser.parse_args()

    for filename in glob.iglob(osp.join(args.images_path, '**/*.jpg'), recursive = True):
        class_name = filename.replace(args.images_path, '').split('/')[args.cls_idx]
        save_dir = osp.join(args.save_path, class_name)
        os.makedirs(save_dir, exist_ok=True)

        new_name =  osp.join(save_dir, filename.replace(args.images_path, '').replace('/', '.'))

        shutil.copy(filename, new_name)



