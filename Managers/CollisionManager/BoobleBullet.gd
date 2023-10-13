extends Node

func emit(collisionArgs):
	var bullet = collisionArgs.bullet
	var booble = collisionArgs.booble
	var player = bullet.get_parent().get_parent();
	player.destroy_booble(bullet, booble)
