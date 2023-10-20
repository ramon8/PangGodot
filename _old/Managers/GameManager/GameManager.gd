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

func _process(_delta):
	if ControllerManager.is_joy_button_just_pressed(pausedBy, JOY_BUTTON_START):
		if(GameManager.is_game_paused()):
			GameManager.unpause_game()

#func _input(event):
#	if "button_index" in event:
#		print(event)

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
	
func is_game_paused():
	return get_tree().paused

func pause_game(playerId: int):
	gamePaused.emit(true, playerId)
	pausedBy = playerId
	get_tree().set_pause(true)
	
func unpause_game():
	gamePaused.emit(false, -1)
	pausedBy = -1
	get_tree().set_pause(false)
