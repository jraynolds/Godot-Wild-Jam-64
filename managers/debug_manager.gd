extends Node

@export var game_debug : bool
@export var character_debug : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	GameManager.signal_scene_loaded.connect(_on_scene_loaded)
	PlayerManager.signal_character_moved.connect(_on_character_moved)


func _on_scene_loaded(scene: PackedScene):
	if game_debug:
		print(get_tree().current_scene.scene_file_path + " loaded.")


func _on_character_moved(prev_location: Vector3, new_location: Vector3):
	if character_debug:
		print("Character moved from " + str(prev_location) + " to " + str(new_location))
