mkdir temp
cp -rf ../src temp/.
cp -rf ../CMakeLists.txt temp/.
docker build -t="online_photometric_calibration:latest" .
rm -rf temp
echo "=================================================================="
echo " Now run: ./step2_launch.sh /PathToMyLocalDir/MyVideos "