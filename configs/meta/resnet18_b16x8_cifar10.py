_base_ = [
    '../_base_/models/resnet18_cifar.py', '../_base_/datasets/cifar10_bs16.py',
    '../_base_/schedules/meta_cifar10_bs128.py', '../_base_/default_runtime.py'
]
