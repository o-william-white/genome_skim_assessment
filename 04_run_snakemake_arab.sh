#!/bin/bash
#SBATCH --partition=short
#SBATCH --output=job_run_snakemake_arab_%j.out
#SBATCH --error=job_run_snakemake_arab_%j.err
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8

source activate sm_skim_assess

snakemake \
   --cores 8 \
   --use-conda \
   --config samples=config/sample_list_arab.txt

echo Complete!

