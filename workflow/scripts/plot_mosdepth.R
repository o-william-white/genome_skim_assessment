library(ggplot2)
library(dplyr)

# get input files
gd_files <- list.files("results/mosdepth/", pattern = ".mosdepth.global.dist.txt")
rg_files <- list.files("results/mosdepth/", pattern = ".regions.bed.gz$")

# read and format global
gd_list <- lapply(gd_files, function(x) {
  dat <- read.table(paste0("results/mosdepth/", x), sep = "\t", col.names = c("chrom", "coverage", "proportion"))
  sample <- gsub(".mosdepth.global.dist.txt", "", x)
  dat$sample <- sample
  return(dat)
})
gd_dat <- do.call("rbind", gd_list)

# plot global
png("results/mosdepth/global_coverage.png", res = 300, height = length(unique(gd_dat$sample))*2, width = length(unique(gd_dat$chrom))*2, units = "in")
ggplot(gd_dat %>% filter(coverage!=0), aes(x=coverage, y=proportion)) + 
  geom_bar(stat="identity") + 
  facet_wrap(vars(sample, chrom), nrow = length(unique(gd_dat$sample)), ncol = length(unique(gd_dat$chrom))) + 
  labs(x = "Coverage", y = "Proportion")
dev.off()

# read and format region
rg_list <- lapply(rg_files, function(x) {
  dat <- read.table(gzfile(paste0("results/mosdepth/", x)), col.names = c("chrom", "start", "stop", "coverage"))
  dat <- dat %>% mutate(mid = ((stop - start) / 2) + start )
  sample <- gsub(".regions.bed.gz", "", x)
  dat$sample <- sample
  return(dat)
})
rg_dat <- do.call("rbind", rg_list)

# plot region
png("results/mosdepth/region_coverage.png", res = 300, height = length(unique(gd_dat$sample))*2, width = length(unique(gd_dat$chrom))*3, units = "in")
ggplot(rg_dat, aes(x=mid, y=coverage)) + 
  geom_line() + 
  facet_wrap(vars(sample, chrom), nrow = length(unique(rg_dat$sample)), ncol = length(unique(rg_dat$chrom)), scales = "free_x") +
  labs(x = "Position", y = "Coverage")
dev.off()

