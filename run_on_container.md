# Test run with docker 

## Download the data

```bash
mkdir input
cd input
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/SchunkertH_21378990_GCST000998/cardiogram_gwas_results.zip
unzip cardiogram_gwas_results.zip
mv CARDIoGRAM_GWAS_RESULTS.txt CARDIoGRAM_GWAS_RESULTS_38.tsv
```

## Build docker container 

```bash
docker build -t lifebit-ai/gsh .
```

## Run 

```bash
run snakemake_command.sh
```