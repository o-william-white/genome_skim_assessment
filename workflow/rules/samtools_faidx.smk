rule samtools_faidx:
    input:
        "results/bgzip_reference/{name}.bgz",
    output:
        "results/bgzip_reference/{name}.bgz.fai",
        "results/bgzip_reference/{name}.bgz.gzi",
    log:
        "logs/samtools_faidx/{name}.log",
    conda:
        "../envs/samtools.yaml"
    threads: 1
    shell:
        """
        samtools faidx {input} &> {log}
        """
