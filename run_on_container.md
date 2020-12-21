# Test run with docker 

## Download the data

```bash
mkdir input
cd input
wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/Ahola-OlliAV_27989323_GCST004420/CTACK.data.gz
gzip -d CTACK.data.gz
mv CTACK.data CTACK_data_38_raw.tsv
mkdir CTACK_data_38
```

An empty folder of same name as file need to be there. Otherwise it will give task exception error.

## Rename header

```bash
awk '{gsub("MarkerName", "variant_id", $0); print}' CTACK_data_38_raw.tsv > CTACK_data_38_temp.tsv 
awk '{gsub("P.value", "p_value", $0); print}' CTACK_data_38_temp.tsv > CTACK_data_38.tsv
```

## Build docker container 

```bash
docker build -t lifebit-ai/gsh .
```

## Run 

```bash
run snakemake_command.sh
```
