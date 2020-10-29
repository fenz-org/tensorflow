FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

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

ENV PY_VER=py37 \
    PYTHON_VERSION=3.7 \
    TENSORFLOW_VERSION=2.1.0 \
    CONDA_VERSION=4.8.2 \
    CONDA_CHANNEL=anaconda \
    CONDA_PROFILE=base \
    USE_DAAL4PY_SKLEARN=YES

RUN wget --quiet \
        https://repo.anaconda.com/miniconda/Miniconda3-${PY_VER}_${CONDA_VERSION}-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate $CONDA_PROFILE" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy


RUN echo "conda ${CONDA_VERSION}" >> /opt/conda/conda-meta/pinned && \
    conda config --system --prepend channels ${CONDA_CHANNEL} && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda clean --all -f -y && \
    conda install -y -c ${CONDA_CHANNEL} \
        scipy=1.4.1 \
        tensorboard=2.1.0 \
        tensorflow=${TENSORFLOW_VERSION}
