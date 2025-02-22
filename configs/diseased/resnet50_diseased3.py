_base_ = [
    '../_base_/models/resnest50.py', '../_base_/datasets/diseased3_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py', '../_base_/default_runtime.py'
]
model = dict(
    head=dict(
        num_classes=3,
        topk=(1,))
)

optimizer = dict(type='SGD', lr=0.01, momentum=0.9, weight_decay=0.0001)
load_from = 'https://download.openmmlab.com/mmclassification/v0/resnet/resnet50_batch256_imagenet_20200708-cfb998bf.pth' 