extends Node2D

func _ready():
	var controllers = Input.get_connected_joypads()
#	ControllerManager.connectedControllers = controllers;
	print(controllers)
#	print(ControllerManager.connectedControllers)
