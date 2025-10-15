// v2.3.0에 대한 스크립트 어셋 변경됨 자세한 정보는
// https://help.yoyogames.com/hc/en-us/articles/360005277377 참조
function save_project(path,chebo_path,music_path){
	file_delete(path);
	var _zip = zip_create();
	zip_add_file(_zip,TEMP+"project/chebo.txt",chebo_path);
	zip_add_file(_zip,TEMP+"project/music.wav",music_path);
	zip_save(_zip,path);
}