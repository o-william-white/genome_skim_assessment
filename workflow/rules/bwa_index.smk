rule bwa_index:
    params:
        name=reference_name
    input:
        "results/bgzip_reference/" + reference_name + ".bgz",
    output:
        idx=temp(multiext("results/bwa_index/" + reference_name + ".bgz", ".amb", ".ann", ".bwt", ".pac", ".sa")),
    log:
        "logs/bwa_index/" + reference_name + ".log",
    wrapper:
        "v5.5.2/bio/bwa/index"
