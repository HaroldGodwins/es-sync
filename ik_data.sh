bin=$JDBC_IMPORTER_HOME/bin
lib=$JDBC_IMPORTER_HOME/lib

# database config
url=jdbc:mysql://musicinfo.mysql.rds.aliyuncs.com:3306/baidumusic
user=kaili
password=ilvhel007

# ik config
index=es_nlp_ik_smart


echo "{
    \"type\": \"jdbc\",
    \"jdbc\": {
        \"driver\": \"com.mysql.jdbc.Driver\",
        \"url\": \"${url}\",
        \"user\": \"${user}\",
        \"password\": \"${password}\",
        \"sql\": [
          {
            \"statement\": \"select id as _id, artist_name as title, artist_name as title_en from xiami_singers\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"${index}\",
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
            \"statement\": \"select id as _id, album_name as title, album_name as title_en from xiami_albums\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"${index}\",
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
            \"statement\": \"select id as _id, song_name as title, song_name as title_en from xiami_album_songs\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"${index}\",
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
            \"statement\": \"select id as _id, title, title as title_en from baidu_songs\"
          }
        ],
        \"elasticsearch\" : {
             \"cluster\" : \"vinci-es-cluster-01\",
             \"host\" : \"localhost\",
             \"port\" : 9300
        },
        \"index\": \"${index}\",
        \"type\": \"baidu_songs\"
    }

}" | java \
       -cp "${lib}/*" \
       -Dlog4j.configurationFile=${bin}/log4j2.xml \
       org.xbib.tools.Runner \
       org.xbib.tools.JDBCImporter