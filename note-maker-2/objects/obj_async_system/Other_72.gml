/// @description Insert description here
// You can write your code in this editor
var _id = async_load[?"id"];
var _idx = array_get_index(ids,_id);

while(_idx >= 0){
	with(callers[_idx]){
		funcs[_idx]();
	}
	array_delete(ids,_idx,1);
	array_delete(callers,_idx,1);
	array_delete(funcs,_idx,1);
	_idx = array_get_index(ids,_id);
}