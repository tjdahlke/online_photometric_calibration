
## Install

We support Ubuntu 14.04 and 16.04, and macOS, but it might work on a
variety of other platforms that meet the dependency requirements.

### Dependencies

The main dependencies are cmake 3.2 or later, a C++11 compiler, and
OpenCV 2.4.

#### Ubuntu 14.04

On Ubuntu 14.04 you need to get a more recent version of cmake.

```
sudo add-apt-repository ppa:george-edison55/cmake-3.x
```

Now continue to install dependencies like for Ubuntu 16.04.

#### Ubuntu 16.04

**Required:**

```
sudo apt-get update
sudo apt-get install \
    build-essential \
    g++ \
    cmake \
    libopencv-dev
```

**Optional:**

CCache can help you speed up repeated builds.

*Note:* You need at least cmake version 3.4 for ccache to work
 automatically.

```
sudo apt-get install ccache
```

### macOS

We assume you have installed [Homebrew](https://brew.sh).


**Required:**

```
brew install cmake opencv@2
```

**Optional:**

```
brew install ccache
```

### Compile

Start in the package directory.

```
mkdir build
cd build
cmake ..
make -j4
```

Optionally you can install the built libraries and executables.

```
sudo make install
```
