_base_ = [
    '../_base_/models/mobilenet_v2_1x.py', '../_base_/datasets/cancer_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py', '../_base_/default_runtime.py'
]
model = dict(
    pretrained='torchvision://shufflenetv2_x1.0',
    head=dict(
        num_classes=2,
        topk=(1,))
)


optimizer = dict(type='SGD', lr=0.01, momentum=0.9, weight_decay=0.0001)
load_from = 'https://download.openmmlab.com/mmclassification/v0/mobilenet_v2/mobilenet_v2_batch256_imagenet_20200708-3b2dc3af.pth' 