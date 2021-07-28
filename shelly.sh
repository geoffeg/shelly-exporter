#!/bin/sh
eval `curl -s http://$v_host/status | jq -r '"power=" + (.meters[0].power|tostring) + "\nstatus=" + (.relays[0].ison|tostring)'`
cat << EOF
# HELP power Current real AC power being drawn, in watts
# TYPE power gauge
power $power
# HELP is_on Current status of the switch
# TYPE is_on gauge
is_on $status
EOF
