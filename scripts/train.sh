#!/bin/bash
set -x

MODEL="lstm_ctc_crf"
DATA_PATH="/workspace/datasets/dna_r9.4.1"
MODEL_PATH="/workspace/model_bin/${MODEL}"
CONFIG_PATH="/workspace/GeneSeq_BaseCaller/configs/${MODEL}.toml"

python bonito/train.py $MODEL_PATH \
	--config $CONFIG_PATH \
	--directory $DATA_PATH \
	--device "cuda:0" \
	--epochs 1 \
	--batch 32 \
	--chunks 100000 \
	--lr 5e-4 \
	--seed 25 \
	-f

