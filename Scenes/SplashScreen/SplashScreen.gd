extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(Callable(self, "on_timeout_finish"))

func on_timeout_finish():
	var mainNode = get_node("/root/Main");
	var next_scene = preload("res://Scenes/StartMenu/start_menu.tscn")
	mainNode.load_new_scene(next_scene)
