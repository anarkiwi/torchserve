#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    g++ \
    gcc \
    git \
    libbz2-dev \
    libev-dev \
    libffi-dev \
    libjpeg-dev \
    liblzma-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libyaml-dev \
    python3-pip \
    tini \
    zlib1g-dev && \
  $(dirname $0)/clone-torchserve.sh && \
  cd serve && \
  python3 ./ts_scripts/install_dependencies.py --environment prod $* && \
  pip install . && \
  cd .. && \
  rm -rf serve && \
  $(dirname $0)/install-common.sh
