extends Control

@export var playerId = 0
var player
var collisionManager

# Called when the node enters the scene tree for the first time.
#	get_node("Managers/CollisionManager").collision.connect(_on_test)
func _ready():
	collisionManager = get_node("/root/Main/Scene/Game/Managers/CollisionManager");
	player = get_node("/root/Main/Scene/Game/Players").get_child(playerId)
	player.lives_change.connect(Callable(self, "lives_change"))
	lives_change(player.lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$LiveNumber.set_text(player.lives)
	pass

func lives_change(lives):
	var livesNodesLength = $Lives.get_child_count()
	$LiveNumber.set_text(str(lives))
	for n in livesNodesLength:
		$Lives.get_child(n).set_visible(n < lives)
	if lives > 4:
		$LiveNumber.set_visible(true)
	
