rule plot_mosdepth:
    input:
        expand(
            "results/mosdepth/{sample}.mosdepth.global.dist.txt",
            sample=sample_data.index.tolist()
        ),
        expand(
            "results/mosdepth/{sample}.regions.bed.gz",
            sample=sample_data.index.tolist()
        ),
    output:
        "results/mosdepth/global_coverage.png",
        "results/mosdepth/region_coverage.png" 
    log:
        "logs/plot_mosdepth/plot_mosdepth.log"
    conda:
        "../envs/plot_mosdepth.yaml"
    shell:
        """
        Rscript workflow/scripts/plot_mosdepth.R &> {log}
        """
