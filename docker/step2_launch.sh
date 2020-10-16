docker run -w /working -v $PWD/../:/working -it online_photometric_calibration:latest
echo "=================================================================="
echo " USAGE: "
echo "./step2_launch.sh /PathToMyLocalDir/MyVideos "
echo " "
echo " Make sure you run ./step1_build.sh successfully first!"