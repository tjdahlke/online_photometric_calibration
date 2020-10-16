# Online Photometric Calibration

Recent direct visual odometry and SLAM algorithms have demonstrated
impressive levels of precision. However, they require a photometric
camera calibration in order to achieve competitive results. Hence, the
respective algorithm cannot be directly applied to an
off-the-shelf-camera or to a video sequence acquired with an unknown
camera. In this work we propose a method for online photometric
calibration which enables to process auto exposure videos with visual
odometry precisions that are on par with those of photometrically
calibrated videos. Our algorithm recovers the exposure times of
consecutive frames, the camera response function, and the attenuation
factors of the sensor irradiance due to vignetting. Gain robust KLT
feature tracks are used to obtain scene point correspondences as input
to a nonlinear optimization framework. We show that our approach can
reliably calibrate arbitrary video sequences by evaluating it on
datasets for which full photometric ground truth is available. We
further show that our calibration can improve the performance of a
state-of-the-art direct visual odometry method that works solely on
pixel intensities, calibrating for photometric parameters in an online
fashion in realtime. For more details please refer to our paper.

If you use this code in your research, we would appreciate if you cite
the respective publication.

**Online Photometric Calibration of Auto Exposure Video for Realtime Visual Odometry and SLAM**
(P. Bergmann, R. Wang, D. Cremers),
*In IEEE Robotics and Automation Letters (RA-L)*, volume 3, 2018.
[[pdf](https://vision.in.tum.de/_media/spezial/bib/bergmann17calibration.pdf)]
[[video](https://youtu.be/nQHMG0c6Iew)]

For more information on photometric calibration, see
https://vision.in.tum.de/research/vslam/photometric-calibration.

**Note:** *This is a preliminary release. You should consider this
research code in beta. All interfaces are subject to change.*

## Install

Docker is the quickest way to get started with this project. Of course, make sure to [install Docker](https://docs.docker.com/get-docker/) on your local system first. The easiest way to get started is to pull a docker image with `online_photometric_calibration` already built. To do this, run the following:

```
cd docker
./quick_start.sh
```

Alternatively, you can also customize the Dockerfile, build from scratch, and run it using:

```
cd docker
./step1_build.sh
./step2_launch.sh
```

Alternatively, to build locally from scratch, please follow the install instructions in [INSTALL.md](INSTALL.md).

## Usage

### Online calibration

**Example usage:**

Download sequence of the TUMmono VO dataset.

```
SEQ=30
wget http://vision.in.tum.de/mono/dataset/sequence_$SEQ.zip
unzip sequence_$SEQ.zip
unzip -d sequence_$SEQ/images sequence_$SEQ/images.zip
```

Run online calibration.

```
build/bin/online_pcalib_demo -i sequence_$SEQ/images --exposure-gt-file sequence_$SEQ/times.txt
```

*Note:* Currently the implementation is not suitable for
 fisheye-lenses with black borders around the image, which includes
 some of the TUMmono VO dataset sequences as well as the TUM VI
 dataset sequences.

### Batch calibration

Online calibration runs the code in a multithreaded way in parallel on the CPU.
If tracking and backend optimization should be performed sequentially and real time 
performance is not required, the system can be run in batch calibration mode.
For running in batch mode, simply add the command line option

```
  --calibration-mode batch
```

For batch calibration you might want to use the exposure times from the optimization
backend rather than the rapidly estimated exposure times from the frontend. In order 
to extract more keyframes to the backend optimizer, the run_settings parameters have to
be adjusted.

These parameters can be changed by manually setting:

```
  --nr-active-frames INT      Maximum number of frames to be stored in the database.
  --keyframe-spacing INT      Number of frames that keyframes are apart in the backend optimizer.
  --min-keyframes-valid INT   Minimum number of frames a feature has to be tracked to be considered for optimization.
```

### Command line options

```
Photometric Calibration
Usage: online_pcalib_demo [OPTIONS]

Options:
  -h,--help                   Print this help message and exit
  -i,--image-folder TEXT=images
                              Folder with image files to read.
  --start-image-index INT=0   Start reading from this image index.
  --end-image-index INT=-1    Stop reading at this image index.
  --image-width INT=640       Resize image to this width.
  --image-height INT=480      Resize image to this height.
  --exposure-gt-file TEXT=times.txt
                              Textfile containing ground truth exposure times for each frame for visualization.
  --calibration-mode TEXT=online
                              Choose 'online' or 'batch'
  --nr-active-frames INT=200  Maximum number of frames to be stored in the database.
  --keyframe-spacing INT=15   Number of frames that keyframes are apart in the backend optimizer.
  --min-keyframes-valid INT=3 Minimum number of frames a feature has to be tracked to be considered for optimization.
```


## License

This project was originally developed at the [TUM computer vision
group](https://vision.in.tum.de) in 2017 by Paul Bergmann.

It is currently maintained by Paul Bermann,
[Rui Wang](https://vision.in.tum.de/members/wangr) and
[Nikolaus Demmel](https://vision.in.tum.de/members/demmeln). See
[AUTHROS.txt](AUTHORS.txt) for a list of contributors.

This project is available under a BSD 3-Clause license.
See [LICENSE.txt](LICENSE.txt)

Among others, we make use of the following libraries:

 * OpenCV ([BSD](https://opencv.org/license.html))
 * CLI11 ([BSD](https://github.com/CLIUtils/CLI11/blob/master/LICENSE))


