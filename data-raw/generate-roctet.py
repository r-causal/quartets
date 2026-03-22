#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "polars>=1.39.2",
#     "roctet",
# ]
#
# [tool.uv.sources]
# roctet = { git = "https://github.com/emilyriederer/roctet",
#            rev = "9a02057484d8b34d37159788771d897cf64145a2" }
# ///

# This python script is made reproducible with in-line `uv`` dependencies
# To run this script as an executable file, install `uv` and run in terminal:
# > cd data-raw
# > chmod +x generate-roctet.py
# > ./generate-roctet.py
# Then run generate-roctet.R to convert the resulting csv to rda 

from roctet import calc_roctet
import polars as pl

dfs_beta = calc_roctet(0.67, method="beta", n_sets=2, n_obsv=1_000)  
dfs_pcws = calc_roctet(0.67, method="piecewise", n_sets=4, n_obsv=1_000)
df = (
  pl.concat(dfs_beta+dfs_pcws[1:3])
    .with_columns(id = pl.col('id') + 1 + 2*(pl.col("method") == pl.lit('piecewise')))
)
df.write_csv('auroc-quartet.csv')
    
