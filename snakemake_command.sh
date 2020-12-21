#!/bin/bash

docker run --init -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD -i lifebit-ai/gsh \
    snakemake --config local_resources="resources/" \
    remote_vcf_location="ftp://ftp.ensembl.org/pub/current_variation/vcf/homo_sapiens/" \
    repo_path="./" \
    desired_build="38" \
    chromosomes="['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', 'X', 'Y', 'MT']" \
    remote_ensembl_variation="ftp://ftp.ensembl.org/pub/current_mysql/homo_sapiens_variation_102_38/" \
    local_synonyms=True \
    --cores 30 \
    --keep-going \
    --rerun-incomplete \
    input/CTACK_data_38/harmonised.qc.tsv
