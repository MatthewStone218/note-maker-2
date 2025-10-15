// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function load_project(path){
	directory_destroy(TEMP+"project");
	if(global.music != -1){
		global.music.free();
	}
	file_copy(path,TEMP+"project/temp_project.zip");
	zip_unzip(TEMP+"project/temp_project.zip",TEMP+"project");
	var _buff = buffer_load(TEMP+"project/chebo.txt");
	var _str = buffer_read(_buff,buffer_string);
	buffer_delete(_buff);
	global.chebo = json_parse(_str);
	global.music = load_music(TEMP+"project/music.wav");
}

global.chebo = {
	prepare_time: 2500000,
	global_note_speed: 1,
	note: [],
};
global.music = -1;