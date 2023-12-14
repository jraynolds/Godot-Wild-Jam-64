extends Node3D
class_name PlayerInput

@export var body : CharacterBody3D
@export var move_speed : Vector2
#@export var move_speed_max : float
#@export var velocity_decay_speed : float

var velocity : Vector2

var pushed_object : Pushable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Vector2.ZERO
	
	if Input.is_action_pressed("character_left"): input.x -= 1
	if Input.is_action_pressed("character_right"): input.x += 1
	if Input.is_action_pressed("character_down"): input.y += 1
	if Input.is_action_pressed("character_up"): input.y -= 1
	
	velocity = Vector2(input.x * move_speed.x, input.y * move_speed.y)


func _physics_process(delta):
	var body_starting_position = body.position
	
	body.velocity = Vector3(velocity.x, 0.0, velocity.y)
	if pushed_object:
		body.velocity.x *= pushed_object.move_speed_multiplier
		body.velocity.z *= pushed_object.move_speed_multiplier
	body.move_and_slide()
	if pushed_object:
		pushed_object.move(body.position - body_starting_position)


func toggle_pushed(pushable : Pushable):
	if pushed_object == pushable:
		pushed_object = null
	else :
		pushed_object = pushable


