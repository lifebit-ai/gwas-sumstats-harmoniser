#!/bin/bash
alias snakemake2="docker run --init -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD -i snakemake snakemake"
