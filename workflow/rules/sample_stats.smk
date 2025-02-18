rule sample_stats:
    input:
        expand(
            "results/bwa_mem/{sample}.bam",
            sample=sample_data.index.tolist()
        ),
        expand(
            "results/dedup/{sample}.bam",
            sample=sample_data.index.tolist()
        ),
        expand(
            "results/mosdepth/{sample}.mosdepth.summary.txt",
            sample=sample_data.index.tolist()
        ),
        expand(
            "results/gcbias/{sample}.gcmetrics.txt",
            sample=sample_data.index.tolist()
        ),
    output:
        "results/sample_stats/sample_stats.txt", 
    log:
        "logs/sample_stats/sample_stats.log"
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        python workflow/scripts/sample_stats.py &> {log}
        """
