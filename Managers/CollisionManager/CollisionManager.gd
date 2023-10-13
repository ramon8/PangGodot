extends Node

signal collision

func _on_collision(collisionId: String, collisionArgs):
	get_node("/root/Main/Scene/Game/Managers/CollisionManager/" + collisionId).emit(collisionArgs)
