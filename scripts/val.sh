#!/bin/sh

bonito evaluate /workspace/model_bin/lstm_crf --directory /workspace/datasets/dna_r9.4.1 --weights 0 --batchsize=8 --chunks=1000

