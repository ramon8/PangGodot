extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("text_move")


func _on_animation_player_animation_finished(anim_name):
	get_node("/root/Main").load_new_scene(preload("res://Scenes/StartMenu/start_menu.tscn"))
