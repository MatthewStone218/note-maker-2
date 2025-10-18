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

if(keyboard_check_pressed(ord("1"))){
	global.editor_div--;
}
if(keyboard_check_pressed(ord("2"))){
	global.editor_div++;
}
global.editor_div = max(1,global.editor_div);

if(!instance_exists(global.editing_obj)){
	global.editing_obj = noone;
}

if(mouse_check_button_pressed(mb_left) && mouse_x < 1400){
	global.editing_obj = instance_create_depth(mouse_x < 675 ? 350 : 1000, -1000, 0, obj_note);
	var _coord_1 = floor((global.note_hit_line_y-mouse_y)/BEAT_GAP);
	var _coord_2 = floor(((global.note_hit_line_y-mouse_y) mod BEAT_GAP)/(BEAT_GAP/global.editor_div));
	global.editing_obj.type = "short";
	global.editing_obj.coord = [_coord_1,_coord_2,global.editor_div,_coord_1,_coord_2,global.editor_div];
}

if(mouse_check_button(mb_left) && instance_exists(global.editing_obj)){
	var _coord_1 = floor((global.note_hit_line_y-mouse_y)/BEAT_GAP);
	var _coord_2 = floor(((global.note_hit_line_y-mouse_y) mod BEAT_GAP)/(BEAT_GAP/global.editor_div));
	if((_coord_1+(_coord_2/global.editor_div)) > (global.editing_obj.coord[0]+(global.editing_obj.coord[1]/global.editing_obj.coord[2]))){
		global.editing_obj.type = "long";
		global.editing_obj.coord = [_coord_1,_coord_2,global.editor_div,_coord_1,_coord_2,global.editor_div];
	} else {
		global.editing_obj.type = "short";
		global.editing_obj.coord[3] = global.editing_obj.coord[0];
		global.editing_obj.coord[4] = global.editing_obj.coord[1];
		global.editing_obj.coord[5] = global.editing_obj.coord[2];
	}
}

if(mouse_check_button_released(mb_left)){
	global.editing_obj = noone;
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