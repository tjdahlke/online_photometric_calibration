echo "=================================================================="
echo " USAGE: "
echo "./quick_start.sh /PathToMyLocalDir/MyVideos "
docker pull tjdahlke/online_photometric_calibration:latest
docker -w /working -v $1:/working -it online_photometric_calibration:latest;