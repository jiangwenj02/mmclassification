_base_ = [
    '../_base_/models/shufflenet_v2_1x.py', '../_base_/datasets/cancer_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py', '../_base_/default_runtime.py'
]
model = dict(
    pretrained='torchvision://shufflenetv2_x1.0',
    head=dict(
        num_classes=2,
        topk=(1,))
)

load_from = 'https://download.openmmlab.com/mmclassification/v0/shufflenet_v2/shufflenet_v2_batch1024_imagenet_20200812-5bf4721e.pth' 