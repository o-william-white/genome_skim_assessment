rule bwa_mem:
    input:
        reads=["results/fastp/{sample}_R1.fastq", "results/fastp/{sample}_R2.fastq"],
        idx=multiext("additional_data/puc19.fasta.gz.bgz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    output:
        "results/bwa_mem/{sample}.bam",
    log:
        "logs/bwa_mem/{sample}.log",
    params:
        extra=r"-R '@RG\tID:{sample}\tSM:{sample}'",
        sorting="samtools",  # Can be 'none', 'samtools' or 'picard'.
        sort_order="coordinate",  # Can be 'queryname' or 'coordinate'.
        sort_extra="",  # Extra args for samtools/picard.
    threads: 8
    wrapper:
        "v5.5.2/bio/bwa/mem"
