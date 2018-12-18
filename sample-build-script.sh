# from codecademy thingy

#!/bin/bash (Which shell?)
current_dir=$(pwd)
echo "Welcome $(whoami)" # welcome user to script

echo "Beginning build..." # let user know build is beginning
firstline=$(head -n 1 source/changelog.md) # grab program version from info file
read -a splitfirstline <<< $firstline # grab program version from info file
version=${splitfirstline[1]} # get value of version
echo "Currently building version" $version "..." # let user know what version they're building

read -p "Exit? Press 1 for yes, 0 for no: " versioncontinue # allow user to quit early from script
if [[ versioncontinue -eq 1 ]]; then
  for filename in source/* # for file in source directory
  do
  	if [[ "$filename" == "source/secretinfo.md" ]] # check if file is source/secretinfo.md
    then
    	echo "NOTE: file $filename is NOT being copied" # let user know secretinfo.md is not being copied
    else
    	echo "File $filename is being copied" # let user know what file is being copied
      cp $filename build/. # copy file
    fi
  done
  ls build/ # show user files copied in requisite directory
  cd current_dir # change directory to directory where script was initially executed 
  echo "Files from version $version are currently in build directory."
else
	echo "Please come back when you are ready"
fi

