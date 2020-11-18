
# Purpose of the repo
Insert data from S3 to ClickHouse. 

# Problem statement
ClickHouse doesn't have native support same like Redshift copy command to insert data from AWS S3 to ClickHouse. 

# Solution
ClickHouse can insert data from local directories. ClickHouse has support for different file formats like CSV, Parquet, JSON etc. So, we used Goofys to mount s3 as a drive to the VM and use the mounted local location to insert data. 

# Prerequisites 

- [ ] Mount S3 as a drive using Goofys using https://github.com/kahing/goofys
- [ ] ClickHouse server up and running
- [ ] Files in s3
- [ ] Table ClickHouse

## Mount S3 

`	• wget https://bit.ly/goofys-latest

	• chmod +x goofys-latest

	• cp goofys-latest /usr/local/bin/goofys

	• mkdir -p /<bucket-name>

	• /usr/local/bin/goofys -f -o allow_other --uid=111 --gid=115 --file-mode=0777 --dir-mode=0777 -o noatime <bucket-name> /<bucket-name>`

