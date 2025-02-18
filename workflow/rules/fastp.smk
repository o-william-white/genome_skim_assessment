rule fastp:
    input:
        sample=get_fastq,
    output:
        trimmed = [temp("results/fastp/{sample}_R1.fastq"), temp("results/fastp/{sample}_R2.fastq")],
        unpaired1 = temp("results/fastp/{sample}_u1.fastq"), 
        unpaired2 = temp("results/fastp/{sample}_u2.fastq"),
        failed = temp("results/fastp/{sample}.failed.fastq"),
        html="results/fastp/{sample}_fastp.html",
        json="results/fastp/{sample}_fastp.json",
    log:
        "logs/fastp/{sample}.log",
    params:
        "--adapter_sequence ACGGCTAGCTA --adapter_sequence_r2 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC"
    threads: 2
    wrapper:
        "v3.13.8/bio/fastp"
