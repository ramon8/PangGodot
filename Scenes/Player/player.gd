extends CharacterBody2D

signal lives_change
signal points_change

const ID = 'player'

var BulletNode = preload("res://Scenes/Bullet/bullet.tscn")
var BallNode = preload("res://Scenes/Ball/ball.tscn")

const SPEED = 100.0
const JUMP_VELOCITY = -100.0
const FIRE_TIME = 5

var controller_id = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 0

var current_fire_time = 0
var lives = 2
var points = 0

var jumpPressed
var firePressed
var leftPressed
var rightPressed


func _ready():
	pass
	$AnimationTree.active = true

func _physics_process(delta):
	jumpPressed = Input.is_joy_button_pressed(controller_id, JOY_BUTTON_A) || Input.is_physical_key_pressed(KEY_W)
	firePressed = Input.is_joy_button_pressed(controller_id, JOY_BUTTON_X) || Input.is_physical_key_pressed(KEY_SPACE)
	leftPressed = Input.is_joy_button_pressed(controller_id, JOY_BUTTON_DPAD_LEFT) || Input.is_physical_key_pressed(KEY_A)
	rightPressed = Input.is_joy_button_pressed(controller_id, JOY_BUTTON_DPAD_RIGHT) || Input.is_physical_key_pressed(KEY_D)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if jumpPressed and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if firePressed:
		fire()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
	direction = int(rightPressed) - int(leftPressed)
	$AnimationTree["parameters/Move/blend_position"] = direction
	if direction:
		$Sprite.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	current_fire_time += 1
	if $AnimationTree["parameters/playback"].get_current_node() != 'fire':
		move_and_slide()

func fire():
	if $Bullets.get_child_count() == 0:
		$AnimationTree["parameters/playback"].travel("fire")
		current_fire_time = 0
		var bullet_instance = BulletNode.instantiate()
		bullet_instance.position = Vector2(position.x, position.y + 6)
		$Bullets.add_child(bullet_instance)

func get_hit():
	if lives > 1:
		lives -= 1
		lives_change.emit(lives)

func destroy_booble(bullet, booble):
	if booble.size > 1:
		create_new_ball(Vector2(50, -75), booble.size - 1, booble.position)
		create_new_ball(Vector2(-50, -75), booble.size - 1, booble.position)
	booble.queue_free()
	bullet.remove()
	print("destroy")

func create_new_ball(velocity: Vector2, size: int, position: Vector2):
	var ball_instance = BallNode.instantiate()
	ball_instance.position = position;
	ball_instance.set_linear_velocity(velocity);
	ball_instance.size = size;
	get_node("/root/Main/Scene/Game/Balls").add_child(ball_instance)
