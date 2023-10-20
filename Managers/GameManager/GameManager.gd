extends Node2D

var currentScene: Node;

func _ready():
	currentScene = get_node("/root/Main/CurrentScene")

func load_new_scene(scenePath):
	if(ResourceLoader.exists(scenePath)):
		var scene_instance = load(scenePath);
		currentScene.get_child(0).queue_free()
		currentScene.add_child(scene_instance.instantiate())
