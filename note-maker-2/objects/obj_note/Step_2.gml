/// @description Insert description here
// You can write your code in this editor
y = global.note_hit_line_y-(coord[0]+(coord[1]/coord[2]))*BEAT_GAP;

if(type == "long"){
	sprite_index = spr_long_note;
	image_yscale = ((coord[3]+(coord[4]/coord[5])) - (coord[0]+(coord[1]/coord[2])))*BEAT_GAP;
} else {
	sprite_index = spr_note;
	image_yscale = global.zoom;
}