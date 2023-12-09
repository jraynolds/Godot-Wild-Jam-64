extends Node3D
class_name Pushable

@export var rigid_body : RigidBody3D
@export var collider : CollisionShape3D
@onready var _area : Area3D = $Area3D
@onready var _area_collider : CollisionShape3D = $Area3D/CollisionShape3D
@export var area_expansion : Vector3

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


func move(translation : Vector3):
	rigid_body.position += translation

func on_body_entered(enterer: Node):
	print("Entered by " + enterer.name)
	if enterer is CharacterBody3D: push_begin(enterer)


func on_body_exited(exiter: Node):
	print("Exited by " + exiter.name)
	if exiter is CharacterBody3D: push_end(exiter)


func push_begin(character : CharacterBody3D):
	print("beginning to push!")
	character.push_begin(self, move_speed_multiplier)


func push_end(character : CharacterBody3D):
	print("ending the push!")
	#character.push_end(rigid_body, move_speed_multiplier)
