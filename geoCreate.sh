#!/bin/sh

curl -XPUT '0:9200/_river/my_mysql_river/_meta' -d '{
"type" : "jdbc",
"jdbc" : {
"url" : "jdbc:mysql://172.16.50.54:3306/test",
"user" : "geo",
"password" : "geo",
"sql" : "select * from test.geo",
"maxbulkactions" : 10
}
}'
