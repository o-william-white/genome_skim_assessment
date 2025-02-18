rule bgzip_reference:
    input: 
        "results/wget_reference/{name}"
    output:
        temp("results/bgzip_reference/{name}.bgz"),
    log:
        "logs/bgzip_reference/{name}.log",
    conda:
        "../envs/samtools.yaml"
    threads: 1
    shell:
        """
        zcat {input} | bgzip -c 1> {output} 2> {log}
        """
