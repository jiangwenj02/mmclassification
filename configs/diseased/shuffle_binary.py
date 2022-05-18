_base_ = [
    '../_base_/models/shufflenet_v2_1x.py', '../_base_/datasets/binary_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_140e.py', '../_base_/default_runtime.py'
]

model = dict(
    head=dict(
        num_classes=2,
        topk=(1,))
)

data = dict(
    samples_per_gpu=32,
    workers_per_gpu=8,
    train=dict(
        data_prefix='/data3/dataset/XY_Capsule/Whole_Image_Classification/bin_categories/train'),
    val=dict(
        data_prefix='/data3/dataset/XY_Capsule/Whole_Image_Classification/bin_categories/test'),
    test=dict(
        data_prefix='/data3/dataset/XY_Capsule/Whole_Image_Classification/bin_categories/test'))

optimizer = dict(type='SGD', lr=0.01, momentum=0.9, weight_decay=0.0001)
load_from = 'https://download.openmmlab.com/mmclassification/v0/shufflenet_v2/shufflenet_v2_batch1024_imagenet_20200812-5bf4721e.pth' 