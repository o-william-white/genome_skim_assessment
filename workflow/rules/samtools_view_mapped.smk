rule samtools_view_mapped:
    input:
        "results/dedup/{sample}.bam",
    output:
        bam="results/samtools/{sample}_mapped.bam",
        idx="results/samtools/{sample}_mapped.bai",
    log:
        "logs/samtools_mapped/{sample}.log",
    params:
        extra="-F 4",  # optional params string
        region="",     # optional region string
    threads: 2
    wrapper:
        "v5.5.2/bio/samtools/view"
