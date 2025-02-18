import os
import subprocess

# open open file to write to
output = open("results/sample_stats/sample_stats.txt", "w")

# write headers
output.write("sample\ttotal_reads\tmapped_reads\tdedup_reads\tdedup_pct\tmean_coverage\tgc_dropout\n")

# iterate through samples
for file in os.listdir("results/bwa_mem/"):
    if file.endswith(".bam"):
        sample = file.replace(".bam", "")
        
        # sample stats 
        total_reads = subprocess.run(["samtools", "view", "-c", "-F", "2048", f"results/bwa_mem/{sample}.bam"], encoding='utf-8', stdout=subprocess.PIPE).stdout.rstrip("\n")
        mapped_reads = subprocess.run(["samtools", "view", "-c", "-F", "2052", f"results/bwa_mem/{sample}.bam"], encoding='utf-8', stdout=subprocess.PIPE).stdout.rstrip("\n")
        dedup_reads = subprocess.run(["samtools", "view", "-c", "-F", "2052", f"results/dedup/{sample}.bam"], encoding='utf-8', stdout=subprocess.PIPE).stdout.rstrip("\n")
        dedup_pct = subprocess.run(["grep", "-A", "1", "PERCENT_DUPLICATION", f"results/dedup/{sample}.metrics.txt"], encoding='utf-8', stdout=subprocess.PIPE).stdout.split("\n")[1].split("\t")[8]
        mean_coverage = subprocess.run(["grep", "-e", "total", "-w", f"results/mosdepth/{sample}.mosdepth.summary.txt"], encoding='utf-8', stdout=subprocess.PIPE).stdout.split("\t")[3]
        gcbias = subprocess.run(["grep", "-A", "1", "GC_DROPOUT", f"results/gcbias/{sample}.summary.txt"], encoding='utf-8', stdout=subprocess.PIPE).stdout.split("\n")[1].split("\t")[6]

        # write stats
        output.write(f"{sample}\t{total_reads}\t{mapped_reads}\t{dedup_reads}\t{dedup_pct}\t{mean_coverage}\t{gcbias}\n")

# close outputs
#sample_list.close()
output.close()

