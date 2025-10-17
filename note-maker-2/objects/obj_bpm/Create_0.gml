/// @description Insert description here
// You can write your code in this editor
inited = false;
first = false;

function draw_bpm(i,a,b){
	y = global.note_hit_line_y-a*BEAT_GAP-(BEAT_GAP/global.editor_div)*b;
	draw_set_font(ft_bpm);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	
	draw_self();
	draw_text(6, y + 2, string_format(global.chebo.bpm[i][0],0,0));
	
	draw_set_color(c_white);
}