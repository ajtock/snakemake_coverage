#!/bin/zsh

#source ~/conda_x86
source ~/.zshrc
conda activate snakemake
snakemake -p --cores --use-conda --conda-create-envs-only --conda-base-path /Users/ajtock/mambaforge_x86/bin
conda deactivate
