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