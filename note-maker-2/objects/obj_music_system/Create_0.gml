/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.music_time = 0;

function play_music(time = global.music_time){
	if(audio_exists(global.music.sound)){
		if(audio_is_playing(global.music.sound)){
			audio_stop_sound(global.music.sound);
		}
		audio_play_sound(global.music.sound);
		audio_sound_set_track_position(global.music.sound,global.music.chebo.prepare_time/1000000+global.music_time)
	}
}