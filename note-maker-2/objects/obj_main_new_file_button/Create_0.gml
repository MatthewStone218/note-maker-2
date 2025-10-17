/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다

file = -1;
function click(){
	var _file = get_save_filename("*.chebo","");
	if(_file == ""){
		return;
	}
	if(file_exists(_file)){
		load_project(_file);
		room_goto(rm_project);
		return;
	}
	global.main_file_handling = true;
	var _async = create_project(_file);
	file = _file;

	register_async(_async, self, function(){
		load_project(file);
		room_goto(rm_editor);
	});
	return;
}