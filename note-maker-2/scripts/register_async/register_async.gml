// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function register_async(_id,_caller,_func){
	array_push(obj_async_system.ids,_id);
	array_push(obj_async_system.callers,_caller);
	array_push(obj_async_system.funcs,_func);
}