#!/bin/bash
#SBATCH --partition=short
#SBATCH --output=job_run_snakemake_puc19_%j.out
#SBATCH --error=job_run_snakemake_puc19_%j.err
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8

source activate sm_skim_assess

snakemake \
   --cores 8 \
   --use-conda \
   --snakefile workflow/Snakefile_puc19 \
   --config samples=config/sample_list_puc19.txt 

echo Complete!

