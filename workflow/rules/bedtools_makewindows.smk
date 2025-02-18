rule bedtools_makewindows:
    input:
        "results/bgzip_reference/{name}.bgz.fai"
    params:
        window_size = window_size
    output:
        "results/bedtools_makewindows/{name}.bed",
    log:
        "logs/bedtools_makewindows/{name}.log",
    conda:
        "../envs/bedtools.yaml"
    threads: 1
    shell:
        """
        bedtools makewindows -g {input} -w {params.window_size} 1> {output} 2> {log}
        """
