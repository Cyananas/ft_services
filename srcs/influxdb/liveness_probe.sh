pgrep influx
return_influx=$?

if [ $return_influx = 0 ]; then
    exit 0
else
    exit 1
fi