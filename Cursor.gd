extends Sprite2D

var speed = 10
@export var deviceId = 0

func _ready():
	pass # Replace with function body.

func _process(_delta):
	var joypad_vec = Vector2(snapped(Input.get_joy_axis(deviceId, 0), 0.1), snapped(Input.get_joy_axis(deviceId, 1), 0.1))
	position = Vector2(position.x + speed * joypad_vec.x, position.y + speed * joypad_vec.y)
	print(joypad_vec)
