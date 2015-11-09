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
            "statement": "select id as _id, album_id, album_name, sub_title, artist_id, artist_name, language, category, album_category, grade, song_count, cd_count, play_count, logo, artist_logo, create_date, update_time, play_authority from xiami_albums"
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