#!/bin/sh
apt-get update && apt-get install -yq curl wget jq
pip install $* opencv-python pandas py-cpuinfo scipy seaborn setuptools thop nvgpu "numpy<2.0"
