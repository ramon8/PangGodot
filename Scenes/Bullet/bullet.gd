extends Area2D

const ID = 'bullet'

func _ready():
	$AnimationPlayer.play("fire")

func _on_animation_player_animation_finished(_anim_name):
	remove()

func remove():
	$AnimationPlayer.seek(0, true)
	queue_free()  

func _on_body_entered(body):
	if "ID" in body and body.ID == 'booble':
		CollisionManager.collision.emit("BoobleBullet", {"bullet": self, "booble": body})

func _on_area_entered(area):
	if "ID" in area and area.ID == 'break':
		area.breakBlock()
		remove()
