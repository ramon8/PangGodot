extends Control

var main
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	$Buttons/PlayButton.connect("button_down", Callable(self, "on_play"))
	$Buttons/ExitButton.connect("button_down", Callable(self, "on_exit"))
	$Buttons/CreditsButton.connect("button_down", Callable(self, "on_credits"))

func on_exit():
	get_tree().quit()
	
func on_play():
	main.load_new_scene(preload("res://Scenes/Game/game.tscn"))
	
func on_credits():
	main.load_new_scene(preload("res://Scenes/Credits/credits.tscn"))
