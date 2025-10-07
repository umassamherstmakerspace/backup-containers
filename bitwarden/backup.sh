status=$(bw status | jq -r '.status')
if [ "$status" = "unauthenticated" ]; then
  bw config server $BW_SERVER
  export BW_SESSION=$(bw login $BW_EMAIL $BW_PASSWORD --raw)
else
  export BW_SESSION=$(bw unlock $BW_PASSWORD --raw)
fi

bw export --organizationid $BW_ORG --format json --output /backup/