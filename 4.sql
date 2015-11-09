select id as _id, artist_id, area, category, gender, company, artist_name, english_name, logo, albums_count, play_count, create_date, update_time from xiami_singers

select id as _id, album_id, album_name, sub_title, artist_id, artist_name, language, category, album_category, grade, song_count, cd_count, play_count, logo, artist_logo, create_date, update_time, play_authority from xiami_albums

select id as _id, song_id, song_name, album_id, album_name, artist_id, artist_name, length, singers, lyric, play_counts, logo, album_logo, artist_logo, sound_equalizer, sound_effect, create_date, update_time from xiami_album_songs

select id as _id, song_id, area, country, title, author, artist_id, ting_uid, song_writer, compose, album_title, album_id, all_artist_ting_uid, all_artist_id, play_type, sound_effect, create_date, update_time from baidu_songs