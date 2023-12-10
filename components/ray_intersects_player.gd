extends RayCast3D
class_name RayIntersectsPlayer

@export var color : Color

signal signal_player_found
var sees_player : bool
signal signal_player_lost

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	force_raycast_update()
	if is_colliding():
		if get_collider() is CharacterBody3D:
			if !sees_player:
				sees_player = true
				signal_player_found.emit()
				return
			return
	if sees_player:
		sees_player = false
		signal_player_lost.emit()
