#!/bin/zsh

source ~/conda_x86
conda activate snakemake
snakemake -p --cores --use-conda
conda deactivate
