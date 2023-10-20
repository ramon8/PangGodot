extends Node2D

var PlayerNode = preload("res://Scenes/Player/player.tscn")
var players = []
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed", Callable(self, "on_controller_connected"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

func on_controller_connected(controllerId, isConnected):
	print(controllerId)
	if isConnected && controllerId != 0 : 
		add_new_player(controllerId)

func add_new_player(controllerId):
	var player_instance = PlayerNode.instantiate()
	player_instance.position = Vector2(100, 100)
	player_instance.controller_id = controllerId
	$Players.add_child(player_instance)
