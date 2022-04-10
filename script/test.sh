python tools/gen_neg_cls.py
python tools/test_robust.py configs/diseased/shuffle_stomach_hr.py work_dirs/shuffle_stomach_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_hr.py work_dirs/seresnet50_b32x8_stomach_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support
python tools/test_robust.py configs/diseased/shuffle_cancer.py work_dirs/shuffle_cancer/latest.pth --show-dir work_dirs/shuffle_cancer/images
python tools/visualizations/vis_cam_config.py configs/diseased/shuffle_stomach_hr.py work_dirs/shuffle_stomach_hr/latest.pth  --target-layers model.backbone.layers.3 --method GradCAM --save-path work_dirs/shuffle_stomach_hr/grad_cam200
python tools/visualizations/vis_cam_config.py configs/diseased/seresnet50_b32x8_stomach_hr.py work_dirs/seresnet50_b32x8_stomach_hr/latest.pth  --target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/seresnet50_b32x8_stomach_hr/grad_cam200

CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/seresnet50_b32x8_stomach_mix_hr/grad_cam20220130 && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth --show-dir work_dirs/seresnet50_b32x8_stomach_mix_hr/result_20220130

CUDA_VISIBLE_DEVICES=1 python tools/train.py configs/diseased/shuffle_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layers.3 --method GradCAM --save-path work_dirs/shuffle_stomach_mix_hr/grad_cam_0124 && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --show-dir work_dirs/shuffle_stomach_mix_hr/result_20220130

python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth --show-dir work_dirs/seresnet50_b32x8_stomach_mix_hr/result_20220130
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --show-dir work_dirs/shuffle_stomach_mix_hr/result_20220130

20220209

CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/seresnet50_b32x8_stomach_mix_hr/grad_cam20220209 && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth --show-dir work_dirs/seresnet50_b32x8_stomach_mix_hr/result_20220209

CUDA_VISIBLE_DEVICES=1 python tools/train.py configs/diseased/shuffle_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layers.3 --method GradCAM --save-path work_dirs/shuffle_stomach_mix_hr/grad_cam20220209 && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --show-dir work_dirs/shuffle_stomach_mix_hr/result_20220209

20220301
CUDA_VISIBLE_DEVICES=2 python tools/train.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/seresnet50_b32x8_stomach_mix_hr/grad_cam20220301 && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/seresnet50_b32x8_stomach_mix_hr.py work_dirs/seresnet50_b32x8_stomach_mix_hr/latest.pth --show-dir work_dirs/seresnet50_b32x8_stomach_mix_hr/result_20220301

20220323
CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/resnet50_multi.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet50_multi.py work_dirs/resnet50_multi/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet50_multi/grad_cam20220301 && \
python tools/test_robust.py configs/diseased/resnet50_multi.py work_dirs/resnet50_multi/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet50_multi.py work_dirs/resnet50_multi/latest.pth --show-dir work_dirs/seresnet50_b32x8_stomach_mix_hr/result_20220323

CUDA_VISIBLE_DEVICES=1 python tools/train.py configs/diseased/resnet50_stomach.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet50_stomach/grad_cam20220323 && \
python tools/test_robust.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth --show-dir work_dirs/resnet50_stomach/result_20220323

CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/shuffle_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layers.3 --method GradCAM --save-path work_dirs/shuffle_stomach_mix_hr/grad_cam20220323 && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --show-dir work_dirs/shuffle_stomach_mix_hr/result_20220323

20220330
CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/resnet50_binary.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet50_binary/grad_cam20220330 && \
python tools/test_robust.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth --show-dir work_dirs/resnet50_binary/result_20220330

20220404
CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/resnet50_binary.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet50_binary/grad_cam20220404 && \
python tools/test_robust.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet50_binary.py work_dirs/resnet50_binary/latest.pth --show-dir work_dirs/resnet50_binary/result_20220404

20220405
CUDA_VISIBLE_DEVICES=1 python tools/train.py configs/diseased/resnet50_stomach.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet50_stomach/grad_cam20220405 && \
python tools/test_robust.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet50_stomach.py work_dirs/resnet50_stomach/latest.pth --show-dir work_dirs/resnet50_stomach/result_20220405

CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/shuffle_stomach_mix_hr.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth  \
--target-layers model.backbone.layers.3 --method GradCAM --save-path work_dirs/shuffle_stomach_mix_hr/grad_cam20220405 && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/shuffle_stomach_mix_hr.py work_dirs/shuffle_stomach_mix_hr/latest.pth --show-dir work_dirs/shuffle_stomach_mix_hr/result_20220405

20220410
CUDA_VISIBLE_DEVICES=1 python tools/train.py configs/diseased/resnet152_binary.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/resnet152_binary.py work_dirs/resnet152_binary/latest.pth  \
--target-layers model.backbone.layer4.2  --method GradCAM --save-path work_dirs/resnet152_binary/grad_cam20220410 && \
python tools/test_robust.py configs/diseased/resnet152_binary.py work_dirs/resnet152_binary/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/resnet152_binary.py work_dirs/resnet152_binary/latest.pth --show-dir work_dirs/resnet152_binary/result_20220410

CUDA_VISIBLE_DEVICES=0 python tools/train.py configs/diseased/squeeze_binary.py && \
python tools/visualizations/vis_cam_config.py configs/diseased/squeeze_binary.py work_dirs/squeeze_binary/latest.pth  \
--target-layers model.backbone.features.13  --method GradCAM --save-path work_dirs/squeeze_binary/grad_cam20220410 && \
python tools/test_robust.py configs/diseased/squeeze_binary.py work_dirs/squeeze_binary/latest.pth  --metrics accuracy precision recall f1_score f2_score support && \
python tools/test_robust.py configs/diseased/squeeze_binary.py work_dirs/squeeze_binary/latest.pth --show-dir work_dirs/squeeze_binary/result_20220410
