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
            "statement": "select id as _id, song_id, area, country, title, author, artist_id, ting_uid, song_writer, compose, album_title, album_id, all_artist_ting_uid, all_artist_id, play_type, sound_effect, create_date, update_time from baidu_songs"
          }
        ],
        "elasticsearch" : {
             "cluster" : "vinci-es-cluster-01",
             "host" : "localhost",
             "port" : 9300
        },
        "index": "baidumusic",
        "type": "baidu_songs"
    }

}' | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter
