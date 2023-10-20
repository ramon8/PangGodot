extends Node

signal collision

func _on_collision(collisionId: String, collisionArgs):
	await CollisionManager.get_node(collisionId).emit(collisionArgs)
