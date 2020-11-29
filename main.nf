

// input file with paths to unharmonised GWASes
ch_input_list = Channel.fromPath()
                    .splitCSV()


process get_vcf_files:

    input:
    file(input_list) from ch_input_list
    output:
        expand("{local}homo_sapiens-chr{{chromosome}}.vcf.gz", local=config["local_resources"])
    params:
        remote_location=config["remote_vcf_location"],
        local_resources=config["local_resources"]
    shell:
        "mkdir -p {params.local_resources}; "
        "wget -P {params.local_resources} {params.remote_location}/homo_sapiens-chr{wildcards.chromosome}.vcf.gz"


process make_parquet_refs:
    input:
        expand("{local}homo_sapiens-chr{{chromosome}}.vcf.gz", local=config["local_resources"])
    output:
        expand("{local}homo_sapiens-chr{{chromosome}}.parquet", local=config["local_resources"])
    params:
        local_resources=config["local_resources"],
        repo_path=config["repo_path"]
    shell:
        "python {params.repo_path}/harmoniser/vcf2parquet.py -f {params.local_resources}/homo_sapiens-chr{wildcards.chromosome}.vcf.gz"

