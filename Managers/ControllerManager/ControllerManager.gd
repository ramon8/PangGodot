extends Node

var connectedControllers
var isJoyJustPressed: Array[Dictionary] = [
	{ JOY_BUTTON_A: false, JOY_BUTTON_B: false, JOY_BUTTON_X: false, JOY_BUTTON_Y: false, JOY_BUTTON_START: false, JOY_BUTTON_DPAD_UP: false, JOY_BUTTON_DPAD_RIGHT: false, JOY_BUTTON_DPAD_LEFT: false, JOY_BUTTON_DPAD_DOWN: false },
	{ JOY_BUTTON_A: false, JOY_BUTTON_B: false, JOY_BUTTON_X: false, JOY_BUTTON_Y: false, JOY_BUTTON_START: false, JOY_BUTTON_DPAD_UP: false, JOY_BUTTON_DPAD_RIGHT: false, JOY_BUTTON_DPAD_LEFT: false, JOY_BUTTON_DPAD_DOWN: false },
	{ JOY_BUTTON_A: false, JOY_BUTTON_B: false, JOY_BUTTON_X: false, JOY_BUTTON_Y: false, JOY_BUTTON_START: false, JOY_BUTTON_DPAD_UP: false, JOY_BUTTON_DPAD_RIGHT: false, JOY_BUTTON_DPAD_LEFT: false, JOY_BUTTON_DPAD_DOWN: false },
	{ JOY_BUTTON_A: false, JOY_BUTTON_B: false, JOY_BUTTON_X: false, JOY_BUTTON_Y: false, JOY_BUTTON_START: false, JOY_BUTTON_DPAD_UP: false, JOY_BUTTON_DPAD_RIGHT: false, JOY_BUTTON_DPAD_LEFT: false, JOY_BUTTON_DPAD_DOWN: false }
]

func is_joy_button_just_pressed(controllerId: int, joyButton: JoyButton):
	if Input.is_joy_button_pressed(controllerId, joyButton):
		if !isJoyJustPressed[controllerId][joyButton]:
			isJoyJustPressed[controllerId][joyButton] = true
			return true
		else:
			return false
	else:
		isJoyJustPressed[controllerId][joyButton] = false
		return false

func is_joy_button_pressed(controllerId: int, joyButton: JoyButton):
	return Input.is_joy_button_pressed(controllerId, joyButton)