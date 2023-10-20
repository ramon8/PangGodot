extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("text_move")


func _on_animation_player_animation_finished(_anim_name):
	var next_scene = preload("res://Scenes/StartMenu/start_menu.tscn")
	GameManager.load_new_scene(next_scene)
