rule wget_reference:
    params:
        path = reference_path,
        name = reference_name,
    output:
        temp("results/wget_reference/{name}"),
    log:
        "logs/wget_reference/{name}.log",
    threads: 1
    shell:
        """
        wget -P results/wget_reference {params.path}/{params.name} &> {log}
        """
