metric_db="db_$(date '+%Y%m%d')"

while :
    do
    for i in {01..10}
	do
	metric_value=$(($(shuf -i 30-60 -n 1)+100))
#	metric_value=100
	host="server$i"
	echo "host: $host -- value:$metric_value"
	curl --silent -i -XPOST "http://localhost:8428/write?db=$metric_db" --data-binary "metrica1,host=$host value=$metric_value" > /dev/null
	sleep 1
	done
done
