/// @description 여기에 설명 삽입
// 이 에디터에 코드를 작성할 수 있습니다
#macro WAD filename_path("WAD")
#macro TEMP (filename_path("WAD")+"TEMP\\")
#macro CM_X (camera_get_view_x(view_camera[0]))
#macro CM_Y (camera_get_view_y(view_camera[0]))
#macro CM_W (camera_get_view_width(view_camera[0]))
#macro CM_H (camera_get_view_height(view_camera[0]))

room_goto(rm_main);