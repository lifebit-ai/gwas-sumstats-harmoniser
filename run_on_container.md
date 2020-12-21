# Test run with docker 

## Download the data

```bash
mkdir input
cd input
wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/Ahola-OlliAV_27989323_GCST004428/harmonised/27989323-GCST004428-EFO_0008292-build37.f.tsv.gz
gzip -d 27989323-GCST004428-EFO_0008292-build37.f.tsv
mv 27989323-GCST004428-EFO_0008292-build37.f.tsv 27989323-GCST004428-EFO_0008292_37.tsv
```

## Build docker container 

```bash
docker build -t lifebit-ai/gsh .
```

## Run 

```bash
run snakemake_command.sh
```
