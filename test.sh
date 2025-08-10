# PROMPT_NETWORK_CONNECTIVITY() {
#     echo "ERROR: Invalid input. Please try again."
#     echo "Are you connected to the internet? [y/n]"
#     read INPUT

#     while [[ -z "$INPUT" || $INPUT != "y" && $INPUT != "n" ]] ; then
#     do
#         PROMPT_NETWORK_CONNECTIVITY
#     done
# }

# # Ask if the user is connected to internet already
# echo "Are you connected to the internet? [y/n]"
# read INPUT
# if [[ -z "$INPUT" || $INPUT != "y" && $INPUT != "n" ]] ; then
#     PROMPT_NETWORK_CONNECTIVITY
# fi

# if [ $USER_INPUT = "n" ] ; then
#     sudo systemctl start iwd
# fi

#!/bin/bash

# # Start a scan and wait a few seconds before retrieving networks
# echo "station wlan0 scan" | iwctl
# sleep 3
# echo "station wlan0 get-networks" | iwctl > temp.txt

#!/bin/bash

iwctl <<EOF
station wlan0 scan
EOF

sleep 3

iwctl <<EOF > temp.txt
station wlan0 get-networks
EOF
