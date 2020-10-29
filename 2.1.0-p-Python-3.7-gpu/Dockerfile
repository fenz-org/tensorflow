FROM python:3.7.7-slim-buster

ENV PYTHON_VERSION=3.7 \
    PY_VER=37 \
    TENSORFLOW_VERSION=2.1.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget --quiet https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-${TENSORFLOW_VERSION}-cp${PY_VER}-cp${PY_VER}m-manylinux2010_x86_64.whl && \
    python -m pip install \
        tensorflow_cpu-${TENSORFLOW_VERSION}-cp${PY_VER}-cp${PY_VER}m-manylinux2010_x86_64.whl && \
    rm tensorflow_cpu-${TENSORFLOW_VERSION}-cp${PY_VER}-cp${PY_VER}m-manylinux2010_x86_64.whl
