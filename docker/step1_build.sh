mkdir temp
cp -rf ../src temp/.
cp -rf ../CMakeLists.txt temp/.
docker build -t="online_photometric_calibration:latest" .
rm -rf temp
printf "\n\n==================================================================\n"
printf " Now run: ./step2_launch.sh /PathToMyLocalDir/MyVideos \n\n"
printf " Then you can run the executables inside the docker image:\n\n"
printf " online_pcalib_demo -i ./images --exposure-gt-file ./times.txt \n"
printf "==================================================================\n\n"
