print("Started - 02_transform_data.R")

rm(list = ls()) #clear workspace

# install.packages("compositions")
library(tidyverse)

rawdata = "data/raw/01_CIT_data.Rdata"
load(rawdata)

# Performs CLR
# Columns are samples, rows are genes.
# For each column divide the cells by the geometric mean of the column.
# Log transform the values.

# NOTE: The CIT_full are intensity and not count values. 
# Perhaps we should consider this for the transformation?

print("Performing CLR")
CIT_full_clr <- CIT_full %>%
  as_tibble(CIT_full, rownames=NA) %>%
  mutate(across(.fns=compositions::clr))

print("Writting clr .csv")
CIT_full_clr %>%
  rownames_to_column("gene") %>%
  write_csv("data/02_CIT_full_clr.csv")

print("Writting annotation file")
CIT_annot %>%
  write_csv("data/02_CIT_annotations.csv")

print("writting CIT_class file")
CIT_classes %>%
  as_tibble(rownames=NA) %>%
  rownames_to_column("CIT_sample") %>%
  write_csv("data/02_CIT_sample_to_class.csv")

print("Finished - 02_transform_data.R")

