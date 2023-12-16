extends Node3D

var character : CharacterBody3D

signal signal_character_moved(last_position: Vector3, new_position: Vector3)
var last_character_position : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	GameManager.signal_scene_loaded.connect(_on_scene_loaded)


func get_character(): return character


func _on_scene_loaded(scene: PackedScene):
	var character_group = get_tree().get_nodes_in_group("player")
	if !len(character_group):
		return
	character = character_group[0]
	last_character_position = Vector3(0, 0, 0)


func _physics_process(delta):
	if !character:
		return
	var new_character_position = character.global_position
	if new_character_position == last_character_position:
		return
	signal_character_moved.emit(last_character_position, new_character_position)
	last_character_position = new_character_position
	
