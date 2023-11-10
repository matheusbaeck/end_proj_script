#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source_git_repo> <destination_git_repo>"
  exit 1
fi

src_repo=$1
dest_repo=$2

git clone "$src_repo" temp_repo
cd temp_repo || exit
find . -name ".git*" -exec rm -rf {} \;
git init
git add .
git commit -m "Initial commit - cloned from $src_repo"
git remote add origin "$dest_repo"
git push -u origin master
echo "Clone, copy, and push completed successfully!"
cd ..
rm -rf temp_repo

