_base_ = [
    '../_base_/models/resnest50.py', '../_base_/datasets/cancer_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py', '../_base_/default_runtime.py'
]
model = dict(
    pretrained='torchvision://resnet50',
    head=dict(
        num_classes=2,
        topk=(1,))
)