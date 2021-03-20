_base_ = [
    '../_base_/models/resnest50.py', '../_base_/datasets/diseased_bs32_pil_resize.py',
    '../_base_/schedules/imagenet_bs256_coslr.py', '../_base_/default_runtime.py'
]

model = dict(
    head=dict(
        num_classes=2,
        topk=(1,))
)

data = dict(
    samples_per_gpu=32,
    workers_per_gpu=2,
    train=dict(
        data_prefix='/data2/dataset/gastro_disease_classification_dataset/gastric_2cls_03082021_combine/train',),
    val=dict(
        data_prefix='/data2/dataset/gastro_disease_classification_dataset/gastric_2cls_03082021_combine/test',),
    test=dict(
        # replace `data/val` with `data/test` for standard test
        data_prefix='/data2/dataset/gastro_disease_classification_dataset/gastric_2cls_03082021_combine/test',))
