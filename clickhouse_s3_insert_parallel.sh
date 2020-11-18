#script to insert parquet data from s3 to clickhouse parallelly (with 20 insert threads running) 
#credentials
clickhouse_prod="<hostname>"
clickhouse_user="<db username>"
clickhouse_pass="<db password>"

#required metadata
s3_loc="<location of files>"
table="<dbname.tablename>"

echo "starttime = $(date)"
for i in $s3_loc/*
do
 cat ${i} | clickhouse-client --host=$clickhouse_prod --user=$clickhouse_user --password=$clickhouse_pass --input_format_parallel_parsing=0  --query="INSERT INTO $table FORMAT Parquet" &
 while [ "$(ps -ef  |grep clickhouse-client | grep $table |wc -l)" -gt 20  ];do
 sleep 1
 done
done
echo "endtime = $(date)"
