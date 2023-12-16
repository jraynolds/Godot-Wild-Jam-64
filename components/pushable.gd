extends Node3D
class_name Pushable

@export var rigid_body : RigidBody3D
@export var collider : CollisionShape3D
@onready var _area : Area3D = $Area3D
@onready var _area_collider : CollisionShape3D = $Area3D/CollisionShape3D
@export var area_expansion : Vector3
@export var player_inside : bool

@export var move_speed_multiplier : float

func _ready():
	assert(collider.shape is BoxShape3D)
	var shape : BoxShape3D = BoxShape3D.new()
	shape.size = Vector3(collider.shape.size.x + area_expansion.x, collider.shape.size.y + area_expansion.y, collider.shape.size.z + area_expansion.z)
	_area_collider.shape = shape
	
	#body.body_entered.connect(func(enterer): if enterer and enterer.get_parent() is CharacterBody3D: push_begin(enterer.parent()))
	#body.body_exited.connect(func(enterer): if enterer and enterer.get_parent() is CharacterBody3D: push_end(enterer.parent()))
	_area.body_entered.connect(on_body_entered)
	_area.body_exited.connect(on_body_exited)


func _process(delta):
	if Input.is_action_just_pressed("character_activate"):
		toggle_push()


func move(translation : Vector3):
	rigid_body.position += translation


func on_body_entered(enterer: Node):
	if enterer is CharacterBody3D: 
		player_inside = true
		OverlayManager.show_box_interaction_readout()


func on_body_exited(exiter: Node):
	if exiter is CharacterBody3D:
		player_inside = false 
		OverlayManager.set_interaction_panel_visible(false)


func toggle_push():
	PlayerManager.get_character().toggle_pushed(self)
