#!/bin/sh

# a complete minimalistic river example for MySQL geo -> Elasticsearch geo search

# - install MySQL e.g. in /usr/local/mysql
# - start MySQL on localhost:3306 (default)
# - prepare a 'test' database in MySQL
# - create empty user '' with empty password ''
# - execute SQL in "geo.dump" /usr/local/mysql/bin/mysql test < src/test/resources/geo.dump
# - then run this script: bash bin/river/mysql/geo.sh

curl -XDELETE 'localhost:9200/_river/my_geo_river/'

curl -XGET 'localhost:9200/_river/_refresh'

curl -XDELETE 'localhost:9200/myjdbc'

curl -XPOST 'localhost:9200/_river/my_geo_river/_meta' -d '
{
"type" : "jdbc",
"jdbc" : {
"url" : "jdbc:mysql://172.16.50.54:3306/test",
"user" : "geo",
"password" : "geo",
"locale" : "en_US",
"poll" : "6s",
"strategy" : "simple",
"autocommit" : true,
"sql" : [
{
"statement" : "select \"myjdbc\" as _index, \"mytype\" as _type, name as _id, city, tel, address, lat as \"location.lat\", lon as \"location.lon\" from geo"
}
],
"index" : "myjdbc",
"type" : "mytype",
"index_settings" : {
"index" : {
"number_of_shards" : 1
}
},
"type_mapping": {
"mytype" : {
"properties" : {
"location" : {
"type" : "geo_point"
}
}
}
}
}
}
'
