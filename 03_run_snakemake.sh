#!/bin/bash
#SBATCH --partition=short
#SBATCH --output=job_run_snakemake_%j.out
#SBATCH --error=job_run_snakemake_%j.err
#SBATCH --mem=4G
#SBATCH --cpus-per-task=4

source activate sm_skim_assess

snakemake --cores 4 --use-conda 

