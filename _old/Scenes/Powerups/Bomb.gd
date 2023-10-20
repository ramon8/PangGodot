extends Area2D

var ID = "powerup"
var powerupId = "bomb"
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y < 192: position.y += gravity * delta

func explode():
	collision_layer = 10
	set_visible(false)
	GameManager.bombExplode.emit()
	await get_tree().create_timer(0.5).timeout
	GameManager.bombExplode.emit()
	await get_tree().create_timer(0.5).timeout
	GameManager.bombExplode.emit()
