extends Control

signal player_added

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_added(controller_id):
	var player_instance = preload("res://Scenes/Player/player.tscn").instantiate()
	player_instance.controller_id = controller_id
	player_instance.position = Vector2(100, 100)
	get_node("/root/Main/Scene").get_child(0).get_node("Players").add_child(player_instance)
