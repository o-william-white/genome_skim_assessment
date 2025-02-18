import pandas as pd
import sys
from snakemake.utils import min_version

# define min version
min_version("8.4.12")

# set configfile
configfile: "config/config.yaml"

# get reference path and filename
reference_path = config["reference_path"]
reference_name = config["reference_name"]

# get window size
window_size = config["window_size"]

# read sample data
if os.path.exists(config["samples"]):
    sample_data = pd.read_csv(config["samples"], sep="\t").set_index("sample", drop=False)
else:
    sys.exit(f"Error: samples file '{config['samples']}' does not exist")

# functions to get metadata sample list
def get_fastq(wildcards):
    fwd = sample_data.loc[wildcards.sample, "forward"]
    rev = sample_data.loc[wildcards.sample, "reverse"]
    return [fwd, rev]
