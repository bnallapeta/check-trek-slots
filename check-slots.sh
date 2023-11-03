#!/bin/bash

# Get the current time in a nice format
TIME=$(date '+%Y-%m-%d %H:%M:%S')

# Get the number of available slots
SLOTS=$(curl -s "https://karnatakaecotourism.com/api/public/landscape_trekSelectTreks/1f9aad9f1ad791528bb43eccfd9538ad791187ee6eb7eb957a48d08e00be5881304003ddd5fc4b00c4da5c50ac4a360a/TRK131/Sun%20Nov%2005%202023%2005:30:00%20GMT+0530%20(India%20Standard%20Time)" | jq -r '.slots[0].slt_aslots')

# Print the time and number of available slots to the console
echo "$TIME: Slots available: $SLOTS"

# Append the time and number of available slots to a file
echo "$TIME: Slots available: $SLOTS" >> slots_log.txt

if (( SLOTS < 50 )); then
  echo "$TIME: Slots less than 50!" >> slots_log.txt
  # Add your notification code here
fi

