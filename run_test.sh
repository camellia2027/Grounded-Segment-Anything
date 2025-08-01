#!/bin/bash

# 运行 RAM + Grounding DINO + SAM 的测试脚本
# 使用 scene0025_00 数据进行测试
# 按照 README 中的说明运行

# 激活 conda 环境
source ~/anaconda3/etc/profile.d/conda.sh
conda activate grounded-sam

# 设置代理
export http_proxy=http://127.0.0.1:10808
export https_proxy=http://127.0.0.1:10808

python run_ram_ground_sam.py \
    --config GroundingDINO/groundingdino/config/GroundingDINO_SwinT_OGC.py \
    --ram_checkpoint models/ram_swin_large_14m.pth \
    --grounded_checkpoint models/groundingdino_swint_ogc.pth \
    --sam_checkpoint models/sam_vit_b.pth \
    --run_sam \
    --dataroot . \
    --split_file val.txt \
    --data_format scannet \
    --tag_mode proposed \
    --box_threshold 0.35 \
    --text_threshold 0.25 \
    --iou_threshold 0.3 \
    --device cuda \
    --categories categories_new.json \
    --save_viz \
    --frame_gap 5
