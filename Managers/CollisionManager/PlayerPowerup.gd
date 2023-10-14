extends Node

func emit(collisionArgs):
	if collisionArgs.powerup == "bomb":
		await collisionArgs.bomb.explode()
