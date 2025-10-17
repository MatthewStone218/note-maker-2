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

if(keyboard_check(vk_control)){
	if(mouse_wheel_down()){
		global.note_zoom_power--;
	}
	if(mouse_wheel_up()){
		global.note_zoom_power++;
	}	
	
	global.note_zoom_power = median(-5,5,global.note_zoom_power);
}

if(mouse_wheel_down()){
	global.editor_inved_y_goal += 100;
}
if(mouse_wheel_up()){
	global.editor_inved_y_goal -= 100;
}

global.editor_inved_y += (global.editor_inved_y_goal-global.editor_inved_y)/4;

var _beat_gap_prev = BEAT_GAP;
global.zoom += (power(global.note_zoom_base,global.note_zoom_power) - global.zoom)/4;
global.editor_inved_y += global.editor_inved_y*(BEAT_GAP-_beat_gap_prev);

camera_set_view_pos(view_camera[0],0,-global.editor_inved_y);