extends Node2D
@export var isMouse = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(_delta):
	if(isMouse):
		position = get_viewport().get_mouse_position()
