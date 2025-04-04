#!/bin/bash

# Check if the first parameter is empty
if [ -z "$1" ]; then
    echo "Error: Send the commit message version. Exiting."
    exit 1
fi

cd ..
cd mt-project-hub.github.io

echo "Removing old files.."
find . -mindepth 1 -maxdepth 1 ! -name ".git" ! -name "CNAME" -exec rm -rf {} \;
cd ..

echo "Copying files.."
find dahiayguille/ -mindepth 1 -maxdepth 1 ! -name ".git" -exec cp -r {} mt-project-hub.github.io/ \;
cd mt-project-hub.github.io

echo "$1"
git add .
git commit -m "$1"
git push origin main