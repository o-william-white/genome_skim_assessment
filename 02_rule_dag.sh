#!/bin/bash 

source activate sm_skim_assess

snakemake --dag | dot -Tsvg > dag.svg
snakemake --rulegraph | dot -Tsvg > rulegraph.svg


