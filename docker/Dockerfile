# FROM nvcr.io/nvidia/pytorch:23.07-py3
FROM nvcr.io/nvidia/pytorch:23.04-py3
# FROM nvcr.io/nvidia/pytorch:22.12-py3
# FROM nvcr.io/nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

## * ==================== Install SAPEON SDK Dependencies ================= * ##
ARG PYTHON_VERSION=python3.8
RUN apt-get update && apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get -y install \
    gcc g++ \
    cmake curl wget \
    gdb git vim  \
    libx11-6 \
    ${PYTHON_VERSION} ${PYTHON_VERSION}-dev ${PYTHON_VERSION}-distutils \
    libgoogle-glog-dev gcc g++ libzip-dev libstdc++6 \
    libboost-dev libboost-serialization-dev libgtest-dev \
    libeigen3-dev \
    libgl1-mesa-glx && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    ${PYTHON_VERSION} get-pip.py && \
    ${PYTHON_VERSION} -m pip install --upgrade pip setuptools wheel pybind11 pybind11-global numpy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


## * ==================== Install Dependencies ============== * ##
RUN pip install -U \
    openmim \
    opencv-python==4.8.0.74 \
    numpy==1.23.5 numba \
    onnxsim onnxoptimizer \
    setuptools==59.5.0 \
    einops 

RUN pip install git+https://github.com/facebookresearch/fvcore.git



# Install MMEngine, MMCV and MMDetection
ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0 7.5 8.0 8.6+PTX" \
    TORCH_NVCC_FLAGS="-Xfatbin -compress-all" \
    FORCE_CUDA="1"

RUN mim install  \
    "mmcv-full==1.6.0" \
    "mmdet==2.28.2" \
    "mmsegmentation==0.30.0" \
    "mmdet3d==1.0.0rc6"

