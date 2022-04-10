# model settings
model = dict(
    type='ImageClassifier',
    backbone=dict(
        type='SqueezeNet',
        init_cfg = dict(
            type='Pretrained', 
            checkpoint='https://download.pytorch.org/models/squeezenet1_0-b66bff10.pth')),
    neck=dict(type='GlobalAveragePooling'),
    head=dict(
        type='LinearClsHead',
        num_classes=1000,
        in_channels=512,
        loss=dict(type='CrossEntropyLoss', loss_weight=1.0),
        topk=(1, 5),
    ))
