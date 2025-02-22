_base_ = [
    '../_base_/models/seresnet50.py',
    '../_base_/datasets/stomach_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py',
    '../_base_/default_runtime.py'
]

model = dict(
    head=dict(
        num_classes=2,
        topk=(1,))
)

data = dict(
    train=dict(data_prefix='/data2/zinan_xiong/gastritis_0227_high_resolution_v1/train'),
    # val=dict(data_prefix='/data2/zinan_xiong/gastritis_1218_high_resolution/test'),
    # test=dict(data_prefix='/data2/zinan_xiong/gastritis_1218_high_resolution/test')
    val=dict(data_prefix='/data2/zinan_xiong/gastritis_0227_high_resolution_v1/test'),
    test=dict(data_prefix='/data2/zinan_xiong/gastritis_0227_high_resolution_v1/test')
    )

# yapf:enable
optimizer_config = dict(
    _delete_=True, grad_clip=dict(max_norm=10, norm_type=2))
    
optimizer = dict(type='SGD', lr=0.01, momentum=0.9, weight_decay=0.0001)
load_from = 'https://download.openmmlab.com/mmclassification/v0/se-resnet/se-resnet50_batch256_imagenet_20200804-ae206104.pth' 
