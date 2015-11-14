es_host=localhost

analyzer=ik_smart
index=es_nlp_$analyzer

#0. delete the index
curl -XDELETE http://${es_host}:9200/${index}

#1. create a index
curl -XPUT http://${es_host}:9200/${index}

#2.create a mapping
#2.1 xiami_albums
curl -XPOST http://${es_host}:9200/${index}/xiami_albums/_mapping -d'
{
    "xiami_albums": {
             "_all": {
            "analyzer": "ik_smart",
            "search_analyzer": "ik_smart",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "title": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "analyzer": "ik_smart",
                "search_analyzer": "ik_smart",
                "include_in_all": "true",
                "boost": 8
            },
            "title_en": {
                "type": "string",
                "analyzer": "english"
            }
        }
    }
}'
#2.2 xiami_singers
curl -XPOST http://${es_host}:9200/${index}/xiami_singers/_mapping -d'
{
    "xiami_singers": {
             "_all": {
            "analyzer": "ik_smart",
            "search_analyzer": "ik_smart",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "title": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "analyzer": "ik_smart",
                "search_analyzer": "ik_smart",
                "include_in_all": "true",
                "boost": 8
            },
            "title_en": {
                "type": "string",
                "analyzer": "english"
            }
        }
    }
}'
#2.3 xiami_album_songs
curl -XPOST http://${es_host}:9200/${index}/xiami_album_songs/_mapping -d'
{
    "xiami_album_songs": {
             "_all": {
            "analyzer": "ik_smart",
            "search_analyzer": "ik_smart",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "title": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "analyzer": "ik_smart",
                "search_analyzer": "ik_smart",
                "include_in_all": "true",
                "boost": 8
            },
            "title_en": {
                "type": "string",
                "analyzer": "english"
            }
        }
    }
}'
#2.4 baidu_songs
curl -XPOST http://${es_host}:9200/${index}/baidu_songs/_mapping -d'
{
    "baidu_songs": {
             "_all": {
            "analyzer": "ik_smart",
            "search_analyzer": "ik_smart",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "title": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "analyzer": "ik_smart",
                "search_analyzer": "ik_smart",
                "include_in_all": "true",
                "boost": 8
            },
            "title_en": {
                "type": "string",
                "analyzer": "english"
            }
        }
    }
}'