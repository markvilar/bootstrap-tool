#!/usr/bin/bash

# Based on the Cuda installation procedure described in the following blog:
# https://tabbas97.medium.com/get-cuda-the-right-way-c68d533bed3e



# Step 1: Download Cuda toolkit runfile from 
# https://developer.nvidia.com/cuda-toolkit-archive
CUDA_VERSION=11.6.2
CUDA_DRIVER_VERSION=510.47.03
wget https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION}/local_installers/cuda_${CUDA_VERSION}_${CUDA_DRIVER_VERSION}_linux.run

# Step 2: Make sure a Nvidia driver of a version equal or higher than the one
# specified in the Cuda runfile. If no previous driver was installed, reboot the
# system.
apt install nvidia-driver-510

# Step 3: Make sure gcc-7 is installed
apt install -y gcc-7 g++-7

# Step 4: Execute the Cuda runfile (with overriding of the default GCC version)
# During the installation, do the following things:
#  - 4.1: Continue when the notification of existing package manager pops up
#  - 4.2: Disable installation of the Nvidia driver
#  - 4.3: Access options, and change the installation path for the Cuda toolkit
sh cuda_${CUDA_VERSION}_${CUDA_DRIVER_VERSION}_linux.run --override

# Step 5: Add the Cuda executable and dynamic library paths to the environmental
# path variables
PATH="${CUDA_PATH}/bin:${PATH}"
LD_LIBRARY_PATH="${CUDA_PATH}/lib64:$LD_LIBRARY_PATH"

# Step 6: Optionally, add the paths to bashrc for automatic pathing for every
# new shell
echo "
if [ -d "$CUDA_PATH" ]; then
    PATH=${CUDA_PATH}/bin:${PATH}
    LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}
fi
" >> ~/.bashrc
