#!/bin/bash

# rsync to backup /home, mount partition -> rsync -> unmount

# define source and destination and device to mount
src="/home"
dest="/mnt/BACKUP"
dev="/dev/sdb3"

echo "##################################"
echo "Start backup ${src} to ${dest}"
echo "##################################"
echo ""

mount_dev() {
    # check if destination is a mount-point
    echo "check if ${dest}/ is a mountpoint ..."
    if mountpoint -q ${dest}/; then
        # check if device is mounted to mountpoint
        s1=$(sudo mount | grep "${dev}")
        s2=$(sudo mount | grep "${dest}")
        if [ "${s1}" == "${s2}" ]; then
            echo "device is already mounted to mountpoint ..."
            return 0
        else
            echo "${dest} is a mountpoint, but not mounted to ${dev} ..." 
            # return unsuccessful
            echo "abort ..."
            exit 1
        fi
    else
        if [ $(mount | grep -c "${dev}") == 1 ]; then
            echo "${dev} is already mounted to some other mountpoint ..."
            # return unsuccessful 
            echo "abort ..."
            exit 1
        fi
    fi

    # mount
    echo "mounting ..."
    sudo mount ${dev} ${dest}
    return 0
}

# mount
mount_dev

# a - archive mode
# H - preserve hard links
# h - human readable
# x - don't cross filesystem boundaries
# --delete - delete files in backup if source does not contain them
# --delete-excluded - delete files in backup which are excluded

# if mounting was successful, sync
if [ $? == 0 ]; then
    echo "syncing ..."
    rsync -aHhvx --delete --delete-excluded --numeric-ids --exclude='lost+found' ${src} ${dest}
    echo ""
    echo "unmounting ..."
    # unmount the device !!
    sudo umount ${dev}
    echo "finished!"
    exit 0
fi

exit 1

