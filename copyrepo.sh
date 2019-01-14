#!/bin/bash
# Clone a git repo and push to a new location
# Usage: copyrepo.sh source-repository-url destination-repository-url
# Ex: copyrepo.sh https://github.com/exampleuser/source-repository.git https://github.com/exampleuser/destination-repository.git

set -e

# this is the name of the temporary directory to use
temp_dir=copyrepo-temp

# this is the url of the repository that will be copied
src_url=$1

# this is the url of the new repository where the source will be copied to
dest_url=$2

# create a copy of the source repository
git clone --bare $src_url $temp_dir

# push the copy to the destination repository
cd $temp_dir
git push --mirror $dest_url

# remove the temporary directory
cd ..
rm -rf $temp_dir
