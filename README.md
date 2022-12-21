# Single Cell RNA Analysis of T Cell Exhaustion in Melanoma and NSCLC

This project is a partial reproduction of the analysis performed by Kim and Park _et al._ 2020[^1]. This initial work is then extended into an exploration of the bulk and single-cell RNA data from Lozano, Chaudhuri, Nene, and Newman _et al._ 2022 [^2], which includes data from a clinical study involving melanoma patients treated with anti-PD-1 or anti-PD-1 + anti-CTLA-4.

Note, there is a similarly titled repository on my GitHub account titled `tcell_exhaustion`. This work is entirely separate.

## Project structure

The project consists of the following subfolders (listed in order of execution):
- `data/`
  - `raw/` Placeholder folder containing compressed versions for reads taken from GEO database.
  - `text/` Placeholder folder for uncompressed read files.
  - `h5ad/` Placeholder folder containing h5ad files of the raw data read in from `text/`.
  - `markers/` Contains output from differential expression analysis.
  - `clinical/` Contains clinical data taken from supplementary data section from [2].
- `preprocess/` Contains preprocessing notebooks for converting raw text files into h5ad files. This was done in order to reduce RAM usage on Colaboratory runtimes, and to save time overall.
- `deg/` Contains notebooks to read and perform differential expression analysis on GEO72056 and GEO99254 data. Also includes an R script using Seurat to perform the same analysis starting with raw text data.
- `clinical/` Contains notebooks to perform clinical analysis on single-cell (GSE189125) and bulk RNA datasets (GSE186143).
[^1]: Kim, K., Park, S., Park, S.Y. et al. Single-cell transcriptome analysis reveals TOX as a promoting factor for T cell exhaustion and a predictor for anti-PD-1 responses in human cancer. Genome Med 12, 22 (2020). https://doi.org/10.1186/s13073-020-00722-9
[^2]: 1. Lozano, A. X., Chaudhuri A. A., Nene A., Newman A. M. et al. T cell characteristics associated with toxicity to immune checkpoint blockade in patients with melanoma. Nat Med 28, 353–362 (2022).
