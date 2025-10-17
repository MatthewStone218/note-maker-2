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
} else {
	if(mouse_wheel_down()){
		global.editor_inved_y_goal -= 100;
	}
	if(mouse_wheel_up()){
		global.editor_inved_y_goal += 100;
	}
}

global.editor_inved_y_goal = max(0,global.editor_inved_y_goal);

var _prev_pos_as_beat_goal = global.editor_inved_y_goal/BEAT_GAP;
var _prev_pos_as_beat = global.editor_inved_y/BEAT_GAP;
global.zoom += (power(global.note_zoom_base,global.note_zoom_power) - global.zoom)/4;
global.editor_inved_y_goal = BEAT_GAP*_prev_pos_as_beat_goal;
global.editor_inved_y = BEAT_GAP*_prev_pos_as_beat;

global.editor_inved_y += (global.editor_inved_y_goal-global.editor_inved_y)/4;
global.editor_inved_y = max(0,global.editor_inved_y);

camera_set_view_pos(view_camera[0],0,round(-global.editor_inved_y));