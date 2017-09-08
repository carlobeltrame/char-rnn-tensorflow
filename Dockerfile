# Based on https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile

FROM ubuntu:16.04

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        Pillow \
        h5py \
        matplotlib \
        numpy \
        pandas \
        scipy \
        sklearn \
        tensorflow

#RUN pip --no-cache-dir install \
#    https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.1-cp27-none-linux_x86_64.whl

# TensorBoard
EXPOSE 6006

RUN echo "echo '1. Place your training data in a file called input.txt inside a directory '\''foo'\''\n2. Train the network:\n   python train.py --data_dir foo\n3. Use the trained network from the last checkpoint (default after every 1000 training steps) to generate text:\n   python sample.py'" > /etc/bash.bashrc

# Make our neural network code available
COPY . /char-rnn-tensorflow

WORKDIR /char-rnn-tensorflow

CMD ["bash"]
