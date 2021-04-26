_base_ = [
    '../_base_/models/laresnet34_cifar.py', '../_base_/datasets/cifar10_bs16.py',
    '../_base_/schedules/cifar10_bs128.py', '../_base_/default_runtime.py'
]

data = dict(workers_per_gpu=0,)

resume_from = 'work_dirs/laresnet34_b16x8_cifar10/latest.pth'
