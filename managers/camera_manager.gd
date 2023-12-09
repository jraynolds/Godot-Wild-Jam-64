extends Node3D

@onready var main_camera : Camera3D = get_viewport().get_camera_3d()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_main_camera(): return main_camera
