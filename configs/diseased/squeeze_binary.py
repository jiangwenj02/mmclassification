_base_ = [
    '../_base_/models/squeeze.py', '../_base_/datasets/binary_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_140e.py', '../_base_/default_runtime.py'
]
model = dict(
    head=dict(
        num_classes=2,
        topk=(1,))
)

optimizer = dict(type='SGD', lr=0.01, momentum=0.9, weight_decay=0.0001)
load_from = 'https://download.pytorch.org/models/squeezenet1_0-b66bff10.pth' 