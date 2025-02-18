rule picard_collectgcbiasmetrics:
    input:
        # BAM aligned to reference genome
        bam="results/dedup/{sample}.bam",
        # reference genome FASTA from which GC-context is inferred
        ref="additional_data/puc19.fasta.gz",
    output:
        metrics="results/gcbias/{sample}.gcmetrics.txt",
        chart="results/gcbias/{sample}.gc.pdf",
        summary="results/gcbias/{sample}.summary.txt",
    params:
        # optional additional parameters, for example,
        extra="--MINIMUM_GENOME_FRACTION 1E-5",
    log:
        "logs/picard/gc_bias/{sample}.log",
    # optional specification of memory usage of the JVM that snakemake will respect with global
    # resource restrictions (https://snakemake.readthedocs.io/en/latest/snakefiles/rules.html#resources)
    # and which can be used to request RAM during cluster job submission as `{resources.mem_mb}`:
    # https://snakemake.readthedocs.io/en/latest/executing/cluster.html#job-properties
    resources:
        mem_mb=1024,
    wrapper:
        "v5.8.1/bio/picard/collectgcbiasmetrics"
