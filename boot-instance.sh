#!/bin/bash

IMAGE_NAME="ubuntu-14.04-x86_64"                # your image name
FLAVOR_NAME="mem1024.disk25G.cpu1"              # your flavor name
KEY_NAME="your-key"                             # your key name
ZONE="zone1"                                    # zone name
USER_DATA_NAME="openfire-instance.txt"          # your user-data file, inside user-data folder
INSTANCE_NAME="openfire"                        # the instance name
CREDS_FILE="Tenant-openrc.sh"                   # tenant credentials file ( bash shell )
CREDS_FILE_FISH_SHELL="Tenant-openrc.fish"      # tenant credentials file ( fish shell )

# check shell type
if [ "$SHELL" == "/bin/bash" ]
then
    source "$CREDS_FILE"
elif [ "$SHELL" == "/usr/bin/fish" ]
then
    . "$CREDS_FILE_FISH_SHELL"
fi

# get image id
echo -n "checking image-id ...  "
IMAGE_ID=$(glance image-list | grep "$IMAGE_NAME " | awk '{print $2}')
echo "image-id: $IMAGE_ID"

if [ "${IMAGE_ID}" == "" ]
then    
    echo "IMAGE_ID is empty!"
    exit
fi

# get flavor id
echo -n "checking flavor-id ...  "
FLAVOR_ID=$(nova flavor-list | grep "$FLAVOR_NAME" | awk '{print $2}')
echo "flavor-id: $FLAVOR_ID"

# set user data
USER_DATA="./user-data/$USER_DATA_NAME"

# boot instance
nova boot --image "$IMAGE_ID"  --key-name "$KEY_NAME" --flavor "$FLAVOR_ID" --availability-zone "$ZONE" --user-data "$USER_DATA" "$INSTANCE_NAME"
