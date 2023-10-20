extends Control

@export var playerId: int = -1
var player

# Called when the node enters the scene tree for the first time.
#	get_node("Managers/CollisionManager").collision.connect(_on_test)
func _ready():
	playerId = player.controllerId
	player.lives_change.connect(Callable(self, "lives_change"))
	player.points_change.connect(Callable(self, "points_change"))
	player.weapon_change.connect(Callable(self, "weapon_change"))
	set_player_data(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	$LiveNumber.set_text(player.lives)
	pass

func set_player_data(player):
	lives_change(player.lives)
	points_change(player.points)

func lives_change(lives):
	var livesNodesLength = $Lives.get_child_count()
	$LiveNumber.set_text(str(lives))
	for n in livesNodesLength:
		$Lives.get_child(n).set_visible(n < lives)
	if lives > 4:
		$LiveNumber.set_visible(true)
	
func points_change(points):
	$Points.set_text(str(points))	
	
func weapon_change(weapon):
	pass
