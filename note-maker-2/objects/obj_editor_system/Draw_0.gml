/// @description Insert description here
// You can write your code in this editor

var _beat_accumuled = 0;
var _beat_mod = 0;
	
draw_set_color(c_white);

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
			
			if(i+1 < array_length(global.chebo.bpm) && _beat_accumuled >= global.chebo.bpm[i+1][1]+(global.chebo.bpm[i+1][2]/global.chebo.bpm[i+1][3])){
				draw_set_font(ft_bpm);
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				draw_set_color(c_black);
	
				draw_sprite(spr_bpm,0,0,global.note_hit_line_y-a*BEAT_GAP-(BEAT_GAP/global.editor_div)*iii);
				draw_text(6, global.note_hit_line_y-a*BEAT_GAP-(BEAT_GAP/global.editor_div)*iii + 2, string_format(global.chebo.bpm[i][0],0,0));
	
				draw_set_color(c_white);
				
				global.bpm_objs[i].inited = true;
				global.bpm_objs[i]._i_ = i;
				global.bpm_objs[i]._a_ = a;
				global.bpm_objs[i]._b_ = iii;
				
				_beat_accumuled = 0;
				_beat_mod = iii;
				_break = true;
				break;
			}
		}
		if(_break){
			break;
		}
	}
	if(_break){
		break;
	}
}

draw_sprite_ext(spr_dot,0,CM_X+1400,CM_Y,1,1080,0,c_white,1);
draw_sprite_ext(spr_dot,0,CM_X,CM_Y+global.note_hit_line_y,1920,1,0,c_green,1);