extends RigidBody2D

const ID = 'bullet'

func _ready():
	$AnimationPlayer.play("fire")

func _physics_process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	remove()
	
func remove():
	$AnimationPlayer.seek(0, true)
	queue_free()  
