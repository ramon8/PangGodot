extends Node

func emit(collisionArgs):
	var bullet = collisionArgs.bullet
	var bubble = collisionArgs.booble
	var player = bullet.get_parent().get_parent();
	bubble.destroy_booble(bullet, bubble)
