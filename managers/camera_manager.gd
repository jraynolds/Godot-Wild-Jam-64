extends Node3D

@export var camera_move_with_player_amount : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	PlayerManager.signal_character_moved.connect(_on_character_moved)


func get_main_camera(): return get_viewport().get_camera_3d()


func _on_character_moved(prev_position: Vector3, new_position: Vector3):
	var translation = new_position - prev_position
	translation *= camera_move_with_player_amount
	get_main_camera().translate(translation)
