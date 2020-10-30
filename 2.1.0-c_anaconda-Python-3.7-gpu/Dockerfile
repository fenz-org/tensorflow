FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/opt/conda/bin:$PATH \
    PY_VER=py37 \
    PYTHON_VERSION=3.7 \
    CONDA_VERSION=4.8.2 \
    CONDA_CNL=anaconda \
    CONDA_PROFILE=base

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        wget \
        bzip2 \
        ca-certificates \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        git \
        mercurial \
        subversion && \
    apt-get clean

RUN wget --quiet \
        https://repo.anaconda.com/miniconda/Miniconda3-${PY_VER}_${CONDA_VERSION}-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate $CONDA_PROFILE" >> ~/.bashrc && \
    echo "conda ${CONDA_VERSION}" >> /opt/conda/conda-meta/pinned && \
    conda config --system --prepend channels ${CONDA_CNL} && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

ENV TENSORFLOW_VERSION=2.1.0 \
    USE_DAAL4PY_SKLEARN=YES

RUN conda install -y -c ${CONDA_CNL} \
        cudatoolkit=${CUDA_VERSION} \
        cudnn=7.6.5 \
        tensorflow-gpu=${TENSORFLOW_VERSION}
