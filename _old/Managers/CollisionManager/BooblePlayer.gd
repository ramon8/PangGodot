extends Node

func emit(collisionArgs):
	var player = collisionArgs.player
	player.get_hit()
