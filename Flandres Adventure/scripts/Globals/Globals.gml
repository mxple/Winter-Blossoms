///Display
#macro DISP_W display_get_width()
#macro DISP_H display_get_height()
#macro WIN_W window_get_width()
#macro WIN_H window_get_height()

#macro VIEW view_camera[0]
#macro VIEW_X camera_get_view_x(VIEW)
#macro VIEW_Y camera_get_view_y(VIEW)
#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_H camera_get_view_height(VIEW)
#macro VIEW_R (VIEW_X + VIEW_W)
#macro VIEW_B (VIEW_Y + VIEW_H)
#macro VIEW_CENTER_X (VIEW_X + VIEW_W/2)
#macro VIEW_CENTER_Y (VIEW_Y + VIEW_H/2)

#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()

global.KEY_LEFT = (vk_left)
global.KEY_RIGHT = (vk_right)
global.KEY_UP = (vk_up)
global.KEY_DOWN = (vk_down)
global.KEY_JUMP = ord("C")
global.KEY_ATTACK = ord("Z")
global.KEY_SPECIAL = ord("X")
global.KEY_ENTER = vk_enter

#macro INPUT_LEFT keyboard_check(global.KEY_LEFT)
#macro INPUT_RIGHT keyboard_check(global.KEY_RIGHT)
#macro INPUT_UP keyboard_check(global.KEY_UP)
#macro INPUT_DOWN keyboard_check(global.KEY_DOWN)
#macro INPUT_JUMP keyboard_check_pressed(global.KEY_JUMP)
#macro INPUT_ATTACK keyboard_check_pressed(global.KEY_ATTACK)
#macro INPUT_SPECIAL keyboard_check(global.KEY_SPECIAL)
#macro INPUT_ENTER keyboard_check_pressed(global.KEY_ENTER)
#macro INPUT_BACK keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape)