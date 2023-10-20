extends Node

func _ready():
	$PauseText.set_visible(false)
	GameManager.gamePaused.connect(Callable(self, "on_game_paused"))

func on_game_paused(isGamePaused, _playerId):
	$PauseText.set_visible(isGamePaused)
