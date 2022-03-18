# GeneSeq_BaseCaller

[![PyPI version](https://badge.fury.io/py/ont-bonito.svg)](https://badge.fury.io/py/ont-bonito)
[![py37](https://img.shields.io/badge/python-3.7-brightgreen.svg)](https://img.shields.io/badge/python-3.7-brightgreen.svg)
[![py38](https://img.shields.io/badge/python-3.8-brightgreen.svg)](https://img.shields.io/badge/python-3.8-brightgreen.svg)
[![py39](https://img.shields.io/badge/python-3.9-brightgreen.svg)](https://img.shields.io/badge/python-3.9-brightgreen.svg)
[![cu111](https://img.shields.io/badge/cuda-11.1-blue.svg)](https://img.shields.io/badge/cuda-11.1-blue.svg)
[![cu113](https://img.shields.io/badge/cuda-11.3-blue.svg)](https://img.shields.io/badge/cuda-11.3-blue.svg)

* [Overview](#Overview)
* [Quickstart](#Quickstart)
* [Performance](#Performance)

## Overview

Nanopore sequencing is a third generation approach used in the sequencing of biopolymers-specifically, polynucleotides in the form of DNA or RNA.

GeneSeq_BaseCaller is developed to build AI applications for Gene Sequence Base calling.

## Quickstart

```bash
# build docker image
docker image build -t lt_basecaller:0.1 . -f Dockerfile

# create container and run
docker run --gpus all -p 8899:8899 --name basecaller_dev --ipc=host -it -v /workspace/GeneSeq_BaseCaller:/workspace/GeneSeq_BaseCaller lt_basecaller:0.1

cd GeneSeq_BaseCaller

# setup
python setup.py develop
```

### Datasets

```bash
# to download ont data
python bonito/download.py --training --data_dir /workspace/datasets/ 

# to download ont models
python bonito/download.py --model --show
python bonito/download.py --model --model_dir /workspace/model_bin/
```

If you have your own hdf5 file, then convert it to numpy data directly.

```bash
python bonito/convert.py /workspace/datasets/*.fast5 /workspace/datasets/
```

### To train your own model or evaluation

```bash
bash scripts/train.sh
bash scripts/val.sh
```

### Basecalling 

```bash
python bonito/basecaller.py /workspace/model_bin/MODEL /workspace/datasets/READs -v --reference /workspace/datasets/REF > basecalls.bam
```

## Performance

| dataset | model | mean_acc | device | epoch |
| :-----: | :----:| :----:| :----:| :----: |
| dna_r9.4.1 | lstm_ctc_crf | 96.37 | A10 | 20 |
| dna_r9.4.1 | quartznet | 95.72 | A10 | 20 |
| dna_r9.4.1 | TransEnc_ctc_crf | 96.04 | A10 | 10 |
| dna_r9.4.1 | conformer_ctc_crf | 97.18 | A100 | 10 |
