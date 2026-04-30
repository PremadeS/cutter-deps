set -euo pipefail

LLVM_NAME=clang+llvm-20.1.8-x86_64-pc-windows-msvc
LLVM_ARCHIVE="$LLVM_NAME.tar.xz"
wget --progress=dot:giga https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.8/$LLVM_ARCHIVE
echo "f229769f11d6a6edc8ada599c0cda964b7dee6ab1a08c6cf9dd7f513e85b107f  ./$LLVM_ARCHIVE" | sha256sum -c -
tar -xf $LLVM_ARCHIVE
export LLVM_INSTALL_DIR=$PWD/$LLVM_NAME
export CMAKE_PREFIX_PATH=$LLVM_INSTALL_DIR


# There is no cl and gcc - this should fail
which cl
which gcc

make PLATFORM=win "PYTHON_WINDOWS=/C/hostedtoolcache/windows/Python/3.12.4/x64/"
