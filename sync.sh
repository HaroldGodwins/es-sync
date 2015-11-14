bin=$JDBC_IMPORTER_HOME/bin
lib=$JDBC_IMPORTER_HOME/lib
url=jdbc:mysql://localhost:3306/baidumusic
user=root
password=ilvhel

echo "{
    \"type\": \"jdbc\",
    \"jdbc\": {
        \"driver\": \"com.mysql.jdbc.Driver\",
        \"url\": \"${url}\",
        \"user\": \"${user}\",
        \"password\": \"${password}\",
        \"sql\": [
          {
            \"statement\": \"select id as _id, artist_id, area, category, gender, company, artist_name, english_name, logo, albums_count, play_count, create_date, update_time from xiami_singers\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"baidumusic\",
        \"type\": \"xiami_singers\"
    }

}" | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter

echo "{
    \"type\": \"jdbc\",
    \"jdbc\": {
        \"driver\": \"com.mysql.jdbc.Driver\",
        \"url\": \"${url}\",
        \"user\": \"${user}\",
        \"password\": \"${password}\",
        \"sql\": [
          {
            \"statement\": \"select id as _id, album_id, album_name, sub_title, artist_id, artist_name, language, category, album_category, grade, song_count, cd_count, play_count, logo, artist_logo, create_date, update_time, play_authority from xiami_albums\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"baidumusic\",
        \"type\": \"xiami_albums\"
    }

}" | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter


echo "{
    \"type\": \"jdbc\",
    \"jdbc\": {
        \"driver\": \"com.mysql.jdbc.Driver\",
        \"url\": \"${url}\",
        \"user\": \"${user}\",
        \"password\": \"${password}\",
        \"sql\": [
          {
            \"statement\": \"select id as _id, song_id, song_name, album_id, album_name, artist_id, artist_name, length, singers, lyric, play_counts, logo, album_logo, artist_logo, sound_equalizer, sound_effect, create_date, update_time from xiami_album_songs\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"baidumusic\",
        \"type\": \"xiami_album_songs\"
    }

}" | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter


echo "{
    \"type\": \"jdbc\",
    \"jdbc\": {
        \"driver\": \"com.mysql.jdbc.Driver\",
        \"url\": \"${url}\",
        \"user\": \"${user}\",
        \"password\": \"${password}\",
        \"sql\": [
          {
            \"statement\": \"select id as _id, song_id, area, country, title, author, artist_id, ting_uid, song_writer, compose, album_title, album_id, all_artist_ting_uid, all_artist_id, play_type, sound_effect, create_date, update_time from baidu_songs\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"baidumusic\",
        \"type\": \"baidu_songs\"
    }

}" | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter