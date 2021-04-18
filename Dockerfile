FROM debian:stretch

RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  curl \
  g++ \
  git \
  libtool \
  make \
  pkg-config \
  unzip \
  && apt-get clean

ADD https://cmake.org/files/v3.15/cmake-3.15.2-Linux-x86_64.sh /cmake-3.15.2-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh /cmake-3.15.2-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
RUN cmake --version

ENV GRPC_RELEASE_TAG v1.16.0

RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc && \
  cd /var/local/git/grpc && \
  git submodule update --init --recursive

RUN echo "-- installing protobuf" && \
  cd /var/local/git/grpc/third_party/protobuf && \
  ./autogen.sh && ./configure --enable-shared && \
  make -j$(nproc) && make -j$(nproc) check && make install && make clean && ldconfig

RUN echo "-- installing grpc" && \
  cd /var/local/git/grpc && \
  make -j$(nproc) && make install && make clean && ldconfig

WORKDIR "/home"
ENTRYPOINT ["/bin/bash"]
CMD ["-s"]
