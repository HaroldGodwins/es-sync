bin=$JDBC_IMPORTER_HOME/bin
lib=$JDBC_IMPORTER_HOME/lib
echo '{
    "type": "jdbc",
    "jdbc": {
        "driver": "com.mysql.jdbc.Driver",
        "url": "jdbc:mysql://musicinfo.mysql.rds.aliyuncs.com:3306/baidumusic",
        "user": "kaili",
        "password": "ilvhel007",
        "sql": [
          {
            "statement": "select id as _id, artist_id, area, category, gender, company, artist_name, english_name, logo, albums_count, play_count, create_date, update_time from xiami_singers"
          }
        ],
        "elasticsearch" : {
             "cluster" : "vinci-es-cluster-01",
             "host" : "localhost",
             "port" : 9300
        },
        "index": "baidumusic",
        "type": "xiami_singers"
    }

}' | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter