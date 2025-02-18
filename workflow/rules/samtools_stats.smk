rule samtools_stats:
    input:
        bam="results/samtools/{sample}_mapped.bam",
    output:
        "results/samtools/{sample}_mapped.txt",
    params:
        extra="",  # Optional: extra arguments.
    log:
        "logs/samtools_stats/{sample}.log",
    wrapper:
        "v5.5.2/bio/samtools/stats"
