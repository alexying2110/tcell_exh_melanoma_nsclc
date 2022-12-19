# Single Cell RNA Analysis of T Cell Exhaustion in Melanoma and NSCLC

This project is a reproduction of the analysis performed by Kim and Park et al. 2020[^1].

Note, there is a similarly titled repository on my GitHub account titled `tcell_exhaustion`. This work is unique is separate, though I do perform auto-encoder based clustering to test the validity of that previously discussed workflow.


## Project structure

The project consists of the following subfolders:
- `data/`
  - `raw/` Placeholder folder containing compressed versions for reads taken from GEO database.
  - `text/` Placeholder folder for uncompressed read files.
  - `h5ad/` Placeholder folder containing h5ad files of the raw data read in from `text/`.
  - `markers/` Contains output from differential expression analysis.
- `preprocess/` Contains preprocessing notebooks for converting raw text files into h5ad files. This was done in order to reduce RAM usage on Colaboratory runtimes, and to save time overall.
- `deg/` Contains notebooks to read and perform differential expression analysis on GEO72056 and GEO99254 data. Also includes an R script using Seurat to perform the same analysis starting with raw text data.
- `trajectory/` Trajectory analysis
- `survival/`
- `autoencoder/`

 
[^1]: Kim, K., Park, S., Park, S.Y. et al. Single-cell transcriptome analysis reveals TOX as a promoting factor for T cell exhaustion and a predictor for anti-PD-1 responses in human cancer. Genome Med 12, 22 (2020). https://doi.org/10.1186/s13073-020-00722-9
