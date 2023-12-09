extends Node2D

@export var move_object : Node2D
@export var move_speed : float
@export var move_speed_max : float
@export var velocity_decay_speed : float

var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("character_left") and !Input.is_action_pressed("character_right"):
		if velocity.x > 0:
			velocity.x -= velocity_decay_speed * delta
		velocity.x -= move_speed * delta
		if abs(velocity.x) > move_speed_max:
			velocity.x = -move_speed_max
	elif Input.is_action_pressed("character_right") and !Input.is_action_pressed("character_left"):
		if velocity.x < 0:
			velocity.x += velocity_decay_speed * delta
		velocity.x += move_speed * delta
		if abs(velocity.x) > move_speed_max:
			velocity.x = move_speed_max
	else :
		if velocity.x < 0:
			velocity.x = min(velocity.x + velocity_decay_speed * delta, 0)
		elif velocity.x > 0:
			velocity.x = max(velocity.x - velocity_decay_speed * delta, 0)
	_move()


func _move():
	if !move_object : return
	if move_object is CharacterBody2D:
		move_object.move_and_collide(velocity)





