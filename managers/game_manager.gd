extends Node

@export var tutorial_scene : PackedScene

signal signal_scene_loaded(scene: PackedScene)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_scene(scene: PackedScene):
	get_tree().change_scene_to_packed(scene)
	signal_scene_loaded.emit(scene)


func start_tutorial():
	change_scene(tutorial_scene)
