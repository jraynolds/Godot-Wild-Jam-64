extends Node3D
class_name LightDetector

@export var light_level_required : float

signal signal_light_level_reached
signal signal_light_level_lost
var light_level_reached : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if light_level_reached:
		if LightManager.light_amount < light_level_required:
			light_level_reached = false
			signal_light_level_lost.emit()
	else :
		if LightManager.light_amount >= light_level_required:
			light_level_reached = true
			signal_light_level_reached.emit()
