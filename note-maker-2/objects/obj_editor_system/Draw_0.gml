/// @description Insert description here
// You can write your code in this editor

var _beat_accumuled = 0;
var _beat_mod = 0;

for(var i = 0; i < array_length(global.chebo.bpm); i++){
	var _break = false;
	for(var ii = -5; ii < (1080 div BEAT_GAP)+1; ii++){
		var a = (global.editor_inved_y div BEAT_GAP) + ii;
		if(a < 0){
			continue;
		}
		for(var iii = 0; iii < global.editor_div; iii++){
			draw_sprite_ext(spr_dot,0,0,global.note_hit_line_y-a*BEAT_GAP-(BEAT_GAP/global.editor_div)*iii,1920,1,0,_beat_mod == iii? c_white : #444444,1);
			_beat_accumuled += 1/global.editor_div;
			if(_beat_accumuled >= global.chebo.bpm[i][1]+(global.chebo.bpm[i][2]/global.chebo.bpm[i][3])){
				_beat_accumuled = 0;
				_beat_mod = iii;
				break;
			}
		}
		if(_break){
			break;
		}
	}
}

draw_sprite_ext(spr_dot,0,CM_X,CM_Y+global.note_hit_line_y,1920,1,0,c_green,1);