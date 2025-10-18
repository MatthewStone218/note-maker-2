/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
#macro BEAT_GAP (global.note_pixel_per_beat*global.zoom)

global.note_hit_line_y = 900;
global.note_pixel_per_beat = 200;
global.note_zoom_base = 1.3;
global.note_zoom_power = 1;
global.zoom = 1;

global.editor_inved_y_goal = 0;
global.editor_inved_y = 0;
global.editor_div = 4;

global.bpm_objs = [];

global.editing_obj = noone;

for(var i = 0; i < array_length(global.chebo.bpm); i++){
	array_push(global.bpm_objs,instance_create_depth(0,0,-100,obj_bpm));
}

global.bpm_objs[0].inited = true;
global.bpm_objs[0]._i_ = 0;
global.bpm_objs[0]._a_ = 0;
global.bpm_objs[0]._b_ = 0;
global.bpm_objs[0].first = true;

window_set_fullscreen(true);