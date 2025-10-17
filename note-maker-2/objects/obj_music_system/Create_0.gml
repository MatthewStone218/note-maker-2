/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
global.music = -1;
global.music_time = 0;
global.music_gain = 1;

function play_music(time = global.music_time){
	if(audio_exists(global.music)){
		if(audio_is_playing(global.music)){
			audio_stop_sound(global.music);
		}
		audio_play_sound(global.music,1,0,global.music_gain);
		audio_sound_set_track_position(global.music,global.chebo.prepare_time/1000000+global.music_time);
	}
}

function stop_music(){
	if(audio_exists(global.music)){
		if(audio_is_playing(global.music)){
			audio_stop_sound(global.music);
		}
	}
}

function set_music_position(time){
	audio_sound_set_track_position(global.music,global.chebo.prepare_time/1000000+global.music_time);
}