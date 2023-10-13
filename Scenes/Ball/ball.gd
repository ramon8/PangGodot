extends RigidBody2D

const SPRITES = [preload("res://Assets/balloon_1.png"), preload("res://Assets/balloon_2.png"), preload("res://Assets/balloon_3.png"),preload("res://Assets/balloon_4.png")]
const SHAPES = [preload("res://Scenes/Ball/shapes/shape_ball_1.tres"), preload("res://Scenes/Ball/shapes/shape_ball_2.tres"), preload("res://Scenes/Ball/shapes/shape_ball_3.tres"),preload("res://Scenes/Ball/shapes/shape_ball_4.tres")]


@export var size = 4
var CollisionManager: Node;

const ID = 'ball'


func _ready():
	CollisionManager = get_node("/root/Main/Scene/Game/Managers/CollisionManager")
	set_ball_size(size)

func _physics_process(delta):
	pass

func set_ball_size(size):
	$Sprite.set_texture(SPRITES[size - 1])
	$CollisionShape2D.set_shape(SHAPES[size - 1])


func _on_body_entered(body):
	if "ID" in body and body.ID == 'bullet':
		CollisionManager.collision.emit("BoobleBullet", {"booble": self, "bullet": body})
		
	if "ID" in body and body.ID == 'player':
		CollisionManager.collision.emit("BooblePlayer", {"booble": self, "player": body})
