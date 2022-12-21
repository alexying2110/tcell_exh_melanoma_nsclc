library(Seurat)
library(data.table)
library(dplyr)

setwd("~/Documents/ecbm_4060/tcell_exh_melanoma_nsclc/data")

nsclc_df <- fread("text/GSE99254_NSCLC.TCell.S11769.norm.centered.txt")
nsclc_df <- nsclc_df %>% as.data.frame
nsclc_df <- nsclc_df[!duplicated(nsclc_df$geneSymbol) & !is.na(nsclc_df$geneSymbol), ]
rownames(nsclc_df) <- nsclc_df$geneSymbol
nsclc_df <- nsclc_df[-c(1, 2)]
nsclc_df <- nsclc_df[grepl("TTC", colnames(nsclc_df))]
nsclc_df <- log2((2 ^ nsclc_df) + 1)

nsclc <- CreateSeuratObject(counts=nsclc_df)

PDCD1_exp_df <- FetchData(nsclc, vars = "PDCD1")

pdcd1_median <- PDCD1_exp_df$PDCD1 %>% median

Idents(nsclc) <- ifelse(
  PDCD1_exp_df$PDCD1 >= pdcd1_median, 
  "high", 
  "low"
)

high_cells <- row.names(PDCD1_exp_df)[PDCD1_exp_df$PDCD1 >= pdcd1_median]
low_cells <- row.names(PDCD1_exp_df)[PDCD1_exp_df$PDCD1 < pdcd1_median]

markers <- FindMarkers(nsclc, ident.1 = "high", ident.2 = "low", logfc.threshold = 0.05)

exp_df <- FetchData(nsclc, vars=row.names(markers))
markers$high_mean <- exp_df[high_cells, row.names(markers)] %>% apply(., 2, mean)
markers$low_mean <- exp_df[low_cells, row.names(markers)] %>% apply(., 2, mean)

markers <- markers[(markers$high_mean >= 2 | markers$low_mean >= 2) & markers$p_val_adj <= 0.05, ]
markers <- markers[order(-markers$avg_log2FC), ]

fwrite(markers, "nsclc_markers_seurat.csv", row.names = T)
