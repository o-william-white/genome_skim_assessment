#!/bin/bash
#SBATCH --partition=short
#SBATCH --output=job_run_snakemake_ecoli_%j.out
#SBATCH --error=job_run_snakemake_ecoli_%j.err
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8

source activate sm_skim_assess

snakemake \
   --cores 8 \
   --use-conda \
   --config samples=config/sample_list_ecoli.txt reference_path=https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/ reference_name=GCF_000005845.2_ASM584v2_genomic.fna.gz window_size=10000

echo Complete!

