extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/PlayButton.connect("button_down", Callable(self, "on_play"))
	$Buttons/ExitButton.connect("button_down", Callable(self, "on_exit"))
	$Buttons/CreditsButton.connect("button_down", Callable(self, "on_credits"))

func on_exit():
	get_tree().quit()

func on_play():
	GameManager.load_new_scene(preload("res://Scenes/Levels/level_1.tscn"))

func on_credits():
	GameManager.load_new_scene(preload("res://Scenes/Credits/credits.tscn"))
