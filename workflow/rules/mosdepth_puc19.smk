rule mosdepth:
    input:
        bam="results/dedup/{sample}.bam",
        bai="results/dedup/{sample}.bam.bai",
        bed="additional_data/puc19.fasta.gz.bgz.bed",
    output:
        "results/mosdepth/{sample}.mosdepth.global.dist.txt",
        "results/mosdepth/{sample}.mosdepth.region.dist.txt",
        "results/mosdepth/{sample}.regions.bed.gz",
        summary="results/mosdepth/{sample}.mosdepth.summary.txt",  # this named output is required for prefix parsing
    log:
        "logs/mosdepth/{sample}.log",
    params:
        extra="--no-per-base --use-median",  # optional
    # additional decompression threads through `--threads`
    threads: 4  # This value - 1 will be sent to `--threads`
    wrapper:
        "v5.8.0/bio/mosdepth"
