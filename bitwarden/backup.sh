bw config server $BW_SERVER

status=$(bw status | jq -r '.status')
echo "$status"
if [ "$status" = "unauthenticated" ]; then
  bw login $BW_EMAIL --passwordenv BW_PASSWORD > tmp_file
else
  bw unlock --passwordenv BW_PASSWORD > tmp_file
fi

export BW_SESSION=$(grep "export BW_SESSION=" tmp_file | sed 's/\$ export BW_SESSION=//')

bw export --organizationid $BW_ORG --format json --output /backup/