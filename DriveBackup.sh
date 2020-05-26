#!/bin/bash

#NOAUTOLOAD

function LogBackup() {
    # Create .backup if it doesn't exist
    printf "Checking if .backup exists\n"
    if [ ! -d ~/.backup ]; then
        printf "It doesn't, so we'll make it\n"
        mkdir ~/.backup
    fi

    # Create a log file
    printf "\n--- BEGIN ---\n" &>> ~/.backup/logfile

    # Get the date and generate a folder name
    DATE=`date +"%Y-%m-%d %H"`
    FOLDER="~/.backup/$DATE"
    printf "Folder path is <%s>\n" "$FOLDER" &>> ~/.backup/logfile
    
    # Create the remote folder
    printf "Creating remote folder\n" &>> ~/.backup/logfile
    rclone -v mkdir "GdrivePersonal:Log/$DATE" &>> ~/.backup/logfile



    # Create the folder in .backup if necessary
    if [ ! -d "$FOLDER" ]; then
        printf "Creating folder in .backup\n"
        mkdir "$FOLDER"
    fi

    # Copy the stuff to the backup folder
    printf "Copying stuff to backup folder\n" &>> ~/.backup/logfile
    cp -r "~/Documents/Personal Log" "$FOLDER" &>> ~/.backup/logfile

    # Copy the folder to the remote
    printf "Copying to remote\n" &>> ~/.backup/logfile
    rclone -v copy "$FOLDER" "GdrivePersonal:Log/$DATE/" &>> ~/.backup/logfile
    
    printf "Deleting local backup folder\n" &>> ~/.backup/logfile
    rm -rf "$FOLDER"
    
    printf '---  END  ---%s' "\n" &>> ~/.backup/logfile
}
