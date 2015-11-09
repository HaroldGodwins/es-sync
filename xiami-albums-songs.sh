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
            "statement": "select id as _id, song_id, song_name, album_id, album_name, artist_id, artist_name, length, singers, lyric, play_counts, logo, album_logo, artist_logo, sound_equalizer, sound_effect, create_date, update_time from xiami_album_songs"
          }
        ],
        "elasticsearch" : {
             "cluster" : "vinci-es-cluster-01",
             "host" : "localhost",
             "port" : 9300
        },
        "index": "baidumusic",
        "type": "xiami_album_songs"
    }

}' | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter
