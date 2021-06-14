# optimizer

optimizer = dict(
    classifier_opt=dict(type='SGD', lr=0.1, momentum=0.9, weight_decay=0.0001),
    meta_opt=dict(type='Adam', lr=0.0002, betas=(0.5, 0.999)))
# optimizer = dict(type='SGD', lr=0.1, momentum=0.9, weight_decay=0.0001)
optimizer_config = dict(grad_clip=None)

# use dynamic runner
runner = dict(
    type='DynamicIterBasedRunner',
    is_dynamic_ddp=True,
    pass_training_status=True)

# learning policy
lr_config = None
