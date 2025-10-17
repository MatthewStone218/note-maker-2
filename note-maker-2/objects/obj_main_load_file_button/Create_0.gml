/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
function click(){
	if(!global.main_file_handling){
		var _file = get_open_filename("*.chebo","");
		if(_file == ""){
			return;
		}
		if(file_exists(_file)){
			load_project(_file);
			room_goto(rm_project);
			return;
		}
	}
}