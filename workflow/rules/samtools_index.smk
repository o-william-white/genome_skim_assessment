rule samtools_index:
    input:
        "results/dedup/{sample}.bam",
    output:
        "results/dedup/{sample}.bam.bai",
    log:
        "logs/samtools_index/{sample}.log",
    params:
        extra="",  # optional params string
    threads: 4  # This value - 1 will be sent to -@
    wrapper:
        "v5.8.0/bio/samtools/index"
