#!/bin/bash

create_files() {
  local file_prefix="file"
  local num_files=$1

  for ((i=1; i<=$num_files; i++)); do
    touch "${file_prefix}_${i}.txt"
    echo "Created file: ${file_prefix}_${i}.txt"
  done
}

create_directories() {
  local dir_prefix="dir"
  local num_dirs=$1

  for ((i=1; i<=$num_dirs; i++)); do
    mkdir "${dir_prefix}_${i}"
    echo "Created directory: ${dir_prefix}_${i}"
  done
}

echo "Choose an option:"
echo "1. Create Files"
echo "2. Create Directories"
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    read -p "Enter the number of files to create: " num_files
    create_files $num_files
    ;;
  2)
    read -p "Enter the number of directories to create: " num_dirs
    create_directories $num_dirs
    ;;
  *)
    echo "Invalid choice. Exiting."
    ;;
esac

