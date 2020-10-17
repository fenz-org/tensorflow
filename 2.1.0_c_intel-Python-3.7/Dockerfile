FROM continuumio/miniconda3:4.8.2

ENV PYTHON_VERSION=3.7 \
    TENSORFLOW_VERSION=2.1.0 \
    CONDA_VERSION=4.8.2 \
    CONDA_CHANNEL=intel \
    CONDA_PROFILE=base \
    USE_DAAL4PY_SKLEARN=YES

RUN echo "conda ${CONDA_VERSION}" >> /opt/conda/conda-meta/pinned && \
    conda config --system --prepend channels ${CONDA_CHANNEL} && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda clean --all -f -y && \
    conda install -y -c ${CONDA_CHANNEL} \
        tensorflow=${TENSORFLOW_VERSION} && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate $CONDA_PROFILE" >> ~/.bashrc
