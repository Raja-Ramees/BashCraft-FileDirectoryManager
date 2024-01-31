#!/bin/bash

delete_files() {
  local file_prefix="file"
  local num_files=$1

  for ((i=1; i<=$num_files; i++)); do
    rm -f "${file_prefix}_${i}.txt"
    echo "Deleted file: ${file_prefix}_${i}.txt"
  done
}

delete_directories() {
  local dir_prefix="dir"
  local num_dirs=$1

  for ((i=1; i<=$num_dirs; i++)); do
    rm -rf "${dir_prefix}_${i}"
    echo "Deleted directory: ${dir_prefix}_${i}"
  done
}

echo "Choose an option:"
echo "1. Delete Files"
echo "2. Delete Directories"
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    read -p "Enter the number of files to delete: " num_files
    delete_files $num_files
    ;;
  2)
    read -p "Enter the number of directories to delete: " num_dirs
    delete_directories $num_dirs
    ;;
  *)
    echo "Invalid choice. Exiting."
    ;;
esac

