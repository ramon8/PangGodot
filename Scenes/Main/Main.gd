extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_new_scene(nextScene):
	var currentScene = $Scene.get_child(0)
	$Scene.remove_child(currentScene)
	$Scene.add_child(nextScene.instantiate())
