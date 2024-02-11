#!/bin/bash

# Function to create files with ACL, SUID, SGID, and Sticky bit options
create_files() {
  local file_prefix="file"
  local num_files=$1
  local current_user=$(whoami)

  for ((i=1; i<=$num_files; i++)); do
    touch "${file_prefix}_${i}.txt"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Created file: ${file_prefix}_${i}.txt by user: $current_user"

    # Apply ACL, SUID, SGID, and Sticky bit options
    setfacl -m u:$current_user:rw- "${file_prefix}_${i}.txt"  # ACL for the user who created the file
    chmod u+s,g+s,o+t "${file_prefix}_${i}.txt"  # Set SUID, SGID, Sticky bit
  done
}

# Function to create directories with ACL, SUID, SGID, and Sticky bit options
create_directories() {
  local dir_prefix="dir"
  local num_dirs=$1
  local current_user=$(whoami)

  for ((i=1; i<=$num_dirs; i++)); do
    mkdir "${dir_prefix}_${i}"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Created directory: ${dir_prefix}_${i} by user: $current_user"

    # Apply ACL, SUID, SGID, and Sticky bit options
    setfacl -m u:$current_user:rwx "${dir_prefix}_${i}"  # ACL for the user who created the directory
    chmod u+s,g+s,o+t "${dir_prefix}_${i}"  # Set SUID, SGID, Sticky bit
  done
}

# Function to delete files and directories
delete_items() {
  local prefix=$1
  local num_items=$2

  for ((i=1; i<=$num_items; i++)); do
    local item="${prefix}_${i}"

    rm -rf "$item"
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Deleted $item"
  done
}

# Function to move/copy files or directories with ACL, SUID, SGID, and Sticky bit options
move_copy_items() {
  local source_prefix=$1
  local destination=$2
  local num_items=$3
  local operation=$4
  local current_user=$(whoami)

  for ((i=1; i<=$num_items; i++)); do
    local source="${source_prefix}_${i}"

    if [ "$operation" == "move" ]; then
      mv -i "$source" "$destination/"  # Added -i for interactive mode
      echo "[$(date +"%Y-%m-%d %H:%M:%S")] Moved $source to $destination/ by user: $current_user"
    elif [ "$operation" == "copy" ]; then
      cp -r "$source" "$destination/"
      echo "[$(date +"%Y-%m-%d %H:%M:%S")] Copied $source to $destination/ by user: $current_user"
    fi

    # Apply ACL, SUID, SGID, and Sticky bit options to the moved/copied item
    setfacl -m u:$current_user:rw- "$destination/$source"  # ACL for the user who performed the action
    chmod u+s,g+s,o+t "$destination/$source"  # Set SUID, SGID, Sticky bit
  done
}

# Function for collaborative action (placeholder)
collaborative_action() {
  echo "Collaborative action is a placeholder. Define your collaborative action here."
  # Add your collaborative action logic here
}

# Function to display menu
display_menu() {
  echo "Choose an option:"
  echo "1. Create Files"
  echo "2. Create Directories"
  echo "3. Delete Files and Directories"
  echo "4. Move/Copy Files and Directories"
  echo "5. Collaborative Action"
  echo "6. Exit"
}

# Main loop
while true; do
  display_menu
  read -p "Enter your choice (1-6): " choice

  case $choice in
    1)
      read -p "Enter the number of files to create: " num_files
      create_files $num_files
      ;;
    2)
      read -p "Enter the number of directories to create: " num_dirs
      create_directories $num_dirs
      ;;
    3)
      read -p "Enter the number of items to delete: " num_items
      delete_items "file" $num

