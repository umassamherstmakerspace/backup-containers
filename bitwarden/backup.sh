bw config server $BW_SERVER
if [[ $(bw status) == *"unauthenticated"* ]]; then
  bw login $BW_EMAIL --passwordenv BW_PASSWORD > tmp
else
  bw unlock --passwordenv BW_PASSWORD > tmp
fi

export BW_SESSION=$(grep "export BW_SESSION=" tmp | sed 's/\$ export BW_SESSION=//')

bw export --organizationid $BW_ORG --format json --output /backup/