ARG GCC_VERSION=11
FROM gcc:$GCC_VERSION

ARG CMAKE_VERSION=3.23.0

RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}-rc1/cmake-${CMAKE_VERSION}-rc1-linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

RUN apt-get update && apt-get install sudo -y \
    && /bin/bash -c  "$(curl -fsSL https://raw.githubusercontent.com/tipi-build/cli/master/install/install_for_macos_linux.sh)"

ENV PATH="/usr/bin/cmake/bin:${PATH}"

