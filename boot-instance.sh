#!/bin/bash

IMAGE_NAME="ubuntu-14.04-x86_64"                # your image name
FLAVOR_NAME="mem1024.disk25G.cpu1"              # your flavor name
KEY_NAME="arainho-terrance"                     # your key name
ZONE="zone1"                                    # zone name
USER_DATA_NAME="openfire-instance.txt"          # your user-data file, inside user-data folder
INSTANCE_NAME="openfire"                        # the instance name
CREDS_FILE="Tenant-openrc.sh"                   # tenant credentials file

source $CREDS_FILE
IMAGE_ID=$(nova list --all-tenants=1 | grep "$IMAGE_NAME " | awk '{print $2}')
FLAVOR_ID=$(nova flavor-list | grep "$FLAVOR_NAME" | awk '{print $2}')
USER_DATA="./user-data/$USER_DATA_NAME"

echo "nova boot --image "$IMAGE_ID"  --key-name "$KEY_NAME" --flavor "$FLAVOR_ID" --availability-zone "$ZONE" --user-data "$USER_DATA" "$INSTANCE_NAME""

