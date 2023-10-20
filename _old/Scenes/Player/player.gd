extends CharacterBody2D

signal lives_change
signal points_change
signal weapon_change

const ID = 'player'

var BulletNode = preload("res://Scenes/Bullet/bullet.tscn")

const SPEED = 115.0
const JUMP_VELOCITY = -100.0
const FIRE_TIME = 5

@export var controllerId = 0
@export var isKeyBoard = false

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
	$AnimationTree.active = true

func _physics_process(delta):
	if ControllerManager.is_joy_button_just_pressed(controllerId, JOY_BUTTON_START):
		GameManager.pause_game(controllerId)
	firePressed = ControllerManager.is_joy_button_just_pressed(controllerId, JOY_BUTTON_X) || (isKeyBoard && Input.is_physical_key_pressed(KEY_SPACE))
	leftPressed = ControllerManager.is_joy_button_pressed(controllerId, JOY_BUTTON_DPAD_LEFT) || (isKeyBoard && Input.is_physical_key_pressed(KEY_A))
	rightPressed = ControllerManager.is_joy_button_pressed(controllerId, JOY_BUTTON_DPAD_RIGHT) || (isKeyBoard && Input.is_physical_key_pressed(KEY_D))

	if not is_on_floor():
		velocity.y += gravity * delta

	if firePressed:
		fire()

	direction = int(rightPressed) - int(leftPressed)
	$AnimationTree["parameters/Move/blend_position"] = direction
	if direction:
		$Sprite.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	current_fire_time += 1
	if can_move():
		move_and_slide()

func fire():
	if $Bullets.get_child_count() == 0:
		$AnimationTree["parameters/playback"].travel("fire")
		current_fire_time = 0
		var bullet_instance = BulletNode.instantiate()
		bullet_instance.position = Vector2(position.x, position.y + 6)
		$Bullets.add_child(bullet_instance)

func get_hit():
	if $AnimationTree["parameters/playback"].get_current_node() != 'hit':
		$AnimationTree["parameters/playback"].travel("hit")
		if lives >= 1:
			lives -= 1
			lives_change.emit(lives)

func get_points(_points):
	points += _points
	points_change.emit(points)

func _on_hit_box_body_entered(body):
	if "ID" in body and body.ID == 'booble':
		CollisionManager.collision.emit("BooblePlayer", { "player": self, "booble": body })

func can_move():
	return $AnimationTree["parameters/playback"].get_current_node() != 'hit' && $AnimationTree["parameters/playback"].get_current_node() != 'fire'


func _on_hit_box_area_entered(area):
	if "ID" in area and area.ID == 'powerup':
		CollisionManager.collision.emit("PlayerPowerup", { "powerup": area.powerupId, "bomb": area })
