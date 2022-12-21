library(data.table)
library(dplyr)
setwd("~/Documents/ecbm_4060/tcell_exh_melanoma_nsclc/data/markers/")
# Note that PDCD1 identified as a deg is a spurious result
m_ca <- fread("melanoma_markers_canonical.csv")
m_sc <- fread("melanoma_markers_scanpy.csv")

n_ca <- fread("nsclc_markers_canonical.csv")
n_sc <- fread("nsclc_markers_scanpy.csv")
n_se <- fread("nsclc_markers_seurat.csv")

intersect(m_sc$names, m_ca$names) %>% length()

intersect(n_sc$names, n_ca$names) %>% length()