FROM continuumio/miniconda3@sha256:456e3196bf3ffb13fee7c9216db4b18b5e6f4d37090b31df3e0309926e98cfe2

LABEL description="Dockerfile containing all the requirements for the gwas-sumstats-harmoniser snakemake pipeline" \
      author="vlad@lifebit.ai"

RUN apt-get update -y  \
    && apt-get install -y wget zip procps gcc \
    && rm -rf /var/lib/apt/lists/*

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/gwas-sumstats-harmoniser/bin:$PATH

COPY requirements.txt /
RUN pip install -r requirements.txt

USER root

WORKDIR /data/

CMD ["bash"]

