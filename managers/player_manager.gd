extends Node3D

var character : CharacterBody3D

signal signal_character_moved(last_position: Vector3, new_position: Vector3)
var last_character_position : Vector3
var character_position : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_tree().get_nodes_in_group("player")[0]
	last_character_position = character.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_character(): return character


func _physics_process(delta):
	var new_character_position = character.global_position
	if new_character_position == character_position:
		return
	last_character_position = character_position
	character_position = new_character_position
	signal_character_moved.emit(last_character_position, character_position)
	
