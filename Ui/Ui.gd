extends Control


# Called when the node enters the scene tree for the first time.

func _ready():
	get_node("/root/Main/Players").child_entered_tree.connect(Callable(self, "on_player_added"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_added(_player):
	var PlayerUiControl = preload("res://Ui/PlayerUiControl.tscn").instantiate()
	PlayerUiControl.player = _player
	$GridContainer.add_child(PlayerUiControl)
