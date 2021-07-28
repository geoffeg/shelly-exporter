#!/bin/sh
eval `curl -s http://$v_host/status | jq -r '"power=" + (.meters[0].power|tostring) + "\nstatus=" + (.relays[0].ison|tostring) + "\ntotal=" + (.meters[0].total|tostring)'`
cat << EOF
# HELP power Current real AC power being drawn, in Watts
# TYPE power gauge
power $power
# HELP is_on Current status of the switch
# TYPE is_on gauge
is_on $status
# HELP total Total energy consumed by the attached electrical appliance in Watt-minute
# TYPE total gauge
total $total
EOF
