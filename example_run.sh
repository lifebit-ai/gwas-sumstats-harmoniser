wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/SchunkertH_21378990_GCST000998/cardiogram_gwas_results.zip
unzip cardiogram_gwas_results.zip
mkdir input
mv CARDIoGRAM_GWAS_RESULTS.txt input/CARDIoGRAM_GWAS_RESULTS.tsv
rm cardiogram_gwas_results.zip md5.txt

./snakemake_command.sh
