/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
if(keyboard_check_pressed(vk_space)){
	with(obj_music_system){
		if(!audio_is_playing(global.music)){
			play_music(0);
		} else {
			stop_music();
		}
	}
}