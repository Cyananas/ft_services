pgrep grafana
return_grafana=$?

if [ $return_grafana = 0 ]; then
    exit 0
else
    exit 1
fi