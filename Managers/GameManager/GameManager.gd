extends Node

signal gamePaused
signal bombExplode
var currenLevel = 1
var timerStarted = false

var pausedBy: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$NextLevelTimer.timeout.connect(Callable(self, "finish_level"))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_tree().paused:
		if ControllerManager.is_joy_button_just_pressed(pausedBy, JOY_BUTTON_START):
			get_tree().paused = false

func _on_game_paused(controllerId):
	pausedBy = controllerId
	get_tree().set_pause(!get_tree().paused)

func finish_level():
	if !timerStarted:
		timerStarted = true
		$NextLevelTimer.start()
		return
	load_new_scene(load("res://Scenes/LevelFinished/LevelFinished.tscn"))

func next_level():
	currenLevel += 1
	load_new_scene(load("res://Scenes/Levels/level_" + str(currenLevel) + ".tscn"))

func load_new_scene(nextScene):
	var scene = get_node("/root/Main/Scene")
	var currentScene = scene.get_child(0)
	scene.remove_child(currentScene)
	scene.add_child(nextScene.instantiate())
