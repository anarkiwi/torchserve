#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    git \
    python3-pip \
    openjdk-17-jdk \
    wget \
    numactl && \
  $(dirname $0)/clone-torchserve.sh && \
  cd serve && \
  pip install -r requirements/common.txt && \
  pip install -r requirements/common_gpu.txt && \
  pip install -r requirements/torch_common.txt && \
  pip install .  && \
  cd .. && \
  rm -rf serve && \
  $(dirname $0)/install-common.sh
