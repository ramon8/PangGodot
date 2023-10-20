extends Area2D

var ID = "break"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func breakBlock():
	get_parent().get_node("AnimationPlayer").play("break")
