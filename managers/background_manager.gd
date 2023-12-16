extends Node3D

@onready var background_layer_1 : MeshInstance3D = $Background1
@onready var background_layer_2 : MeshInstance3D = $Background2
@onready var background_layer_3 : MeshInstance3D = $Background3

@export var layer_1_move_mult : Vector3
@export var layer_2_move_mult : Vector3
@export var layer_3_move_mult : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


func _connect_signals():
	PlayerManager.signal_character_moved.connect(_on_character_moved)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_character_moved(prev_position: Vector3, new_position: Vector3):
	var character_translation = new_position - prev_position
	background_layer_1.translate(-character_translation * layer_1_move_mult)
	background_layer_2.translate(-character_translation * layer_2_move_mult)
	background_layer_3.translate(-character_translation * layer_3_move_mult)
