extends RigidBody2D

const SPRITES = [preload("res://Assets/balloon_1.png"), preload("res://Assets/balloon_2.png"), preload("res://Assets/balloon_3.png"),preload("res://Assets/balloon_4.png")]
const SHAPES = [preload("res://Scenes/Ball/shapes/shape_ball_1.tres"), preload("res://Scenes/Ball/shapes/shape_ball_2.tres"), preload("res://Scenes/Ball/shapes/shape_ball_3.tres"),preload("res://Scenes/Ball/shapes/shape_ball_4.tres")]

@export var size = 4

const ID = 'booble'

func _ready():
	GameManager.bombExplode.connect(Callable(self, "explode_bomb_recursive"))
	set_ball_size(size)


func set_ball_size(_size):
	$Sprite.set_texture(SPRITES[_size - 1])
	$CollisionShape2D.set_shape(SHAPES[_size - 1])

func _on_animation_player_animation_finished(anim_name):
	queue_free()

func destroy_booble(bullet, bubble):
	var bubleLeft;
	var bubleRight;
	if get_node("/root/Main/Boobles").get_child_count() == 1 and get_node("/root/Main/Boobles").get_child(0).size == 1: GameManager.finish_level()
	if bubble.size > 1:
		bubleLeft = create_new_ball(Vector2(50, -75), bubble.size - 1, bubble.position)
		bubleRight = create_new_ball(Vector2(-50, -75), bubble.size - 1, bubble.position)
	bubble.get_node("AnimationPlayer").play("explode")
	if bullet: bullet.remove()
	return [bubleLeft, bubleRight]

func create_new_ball(_velocity: Vector2, _size: int, _position: Vector2):
	var bubbleInstance = load(scene_file_path).instantiate()
	bubbleInstance.position = _position;
	bubbleInstance.set_linear_velocity(_velocity);
	bubbleInstance.size = _size;
	get_node("/root/Main/Boobles").add_child(bubbleInstance)
	return bubbleInstance

func explode_bomb_recursive():
	if size > 1:
		var _bubblesArray = destroy_booble(false, self)
