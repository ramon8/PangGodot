extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(Callable(GameManager, "next_level"))
	$Timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
