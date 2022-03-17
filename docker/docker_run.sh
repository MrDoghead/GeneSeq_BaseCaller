#!/bin/bash/

docker run --gpus all -p 8899:8899 --name basecaller_dev1 --ipc=host -it \
        -v /workspace/GeneSeq_BaseCaller:/workspace/GeneSeq_BaseCaller \
        -v /workspace/GeneSeq_BaseCaller/datasets:/workspace/datasets \
        -v /workspace/GeneSeq_BaseCaller/model_bin:/workspace/model_bin \
        lt_basecaller:0.1

