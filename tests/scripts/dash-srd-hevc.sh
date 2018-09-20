test_begin "dash-srd-hevc"

do_test "$MP4BOX -add $EXTERNAL_MEDIA_DIR/counter/counter_1280_720_I_25_tiled_1mb.hevc:split_tiles -new $TEMP_DIR/file.mp4" "dash-input-preparation"
do_hash_test $TEMP_DIR/file.mp4 "split-tiles"

do_test "$MP4BOX -dash 1000 -profile live $TEMP_DIR/file.mp4 -out $TEMP_DIR/file.mpd" "basic-dash"

do_hash_test $TEMP_DIR/file.mpd "mpd"
do_hash_test $TEMP_DIR/file_set1_init.mp4 "init"
do_hash_test $TEMP_DIR/file_track1_dash.mp4 "base_tile"
do_hash_test $TEMP_DIR/file_track2_dash.mp4 "tt1"
do_hash_test $TEMP_DIR/file_track10_dash.mp4 "tt9"

do_playback_test "$TEMP_DIR/file.mpd" "play-srd-dash"

test_end
