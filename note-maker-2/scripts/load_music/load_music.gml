// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function load_music(path){
	var _file = buffer_load(path);
	var _sample_rate = buffer_peek(_file, 24, buffer_u32);
	var _audio_bits = buffer_peek(_file, 34, buffer_u16);
	var _samples = (buffer_get_size(_file) - 44) div _audio_bits;
	var _sound = audio_create_buffer_sound(_file, buffer_s16, _sample_rate, 44, _samples, audio_mono);
	return new music(_file,_sound);
}

function music(buffer,sound) constructor{
	self.buffer = buffer;
	self.sound = sound;
	static free = function(){
		audio_free_buffer_sound(self.sound);
		buffer_delete(self.buffer);
	}
}