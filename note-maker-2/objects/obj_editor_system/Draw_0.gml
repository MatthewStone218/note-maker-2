/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < (1080 div BEAT_GAP)+1; i++){
	var ii = (global.editor_inved_y div BEAT_GAP) + i;
	draw_sprite_ext(spr_dot,0,CM_X,global.note_hit_line_y-ii*BEAT_GAP,1920,1,0,c_white,1);
	for(var a = 1; a < global.editor_div; a++){
		draw_sprite_ext(spr_dot,0,CM_X,global.note_hit_line_y-ii*BEAT_GAP-(BEAT_GAP/global.editor_div)*a,1920,1,0,#444444,1);
	}
}

draw_sprite_ext(spr_dot,0,CM_X,CM_Y+global.note_hit_line_y,1920,1,0,c_green,1);