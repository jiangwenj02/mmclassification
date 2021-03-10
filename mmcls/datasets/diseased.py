import os

import numpy as np

from .imagenet import ImageNet
from .builder import DATASETS


@DATASETS.register_module()
class Diseased(ImageNet):
    """`ImageNet <http://www.image-net.org>`_ Dataset.

    This implementation is modified from
    https://github.com/pytorch/vision/blob/master/torchvision/datasets/imagenet.py  # noqa: E501
    """

    IMG_EXTENSIONS = ('.jpg', '.jpeg', '.png', '.ppm', '.bmp', '.pgm', '.tif')
    CLASSES = [
        'diseased', 'disease_free'
    ]
