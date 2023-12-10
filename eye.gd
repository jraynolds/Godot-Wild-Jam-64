extends Node3D

@onready var raycaster : RayIntersectsPlayer = $Rotateables/RayIntersectsPlayer
@onready var eyeball : MeshInstance3D = $Rotateables/MeshInstance3D
@onready var rotate_node : Node3D = $Rotateables
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var alert_time : float
var alert_time_left : float
var alerted : bool
signal signal_alerted

var sees_player : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	raycaster.signal_player_found.connect(_player_found)
	raycaster.signal_player_lost.connect(_player_lost)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _player_found():
	if !sees_player:
		animation_player.stop()
		rotate_node.look_at(PlayerManager.character.global_transform.origin, Vector3(0, 0, -1), true)
		alert_time_left = alert_time
	sees_player = true


func _player_lost():
	if sees_player:
		_play_animation_after_wait()
	sees_player = false


func _play_animation_after_wait():
	await get_tree().create_timer(1.0).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(rotate_node, "rotation_degrees", Vector3(0, 0, 0), 1)
	tween.tween_callback(
		func(): 
			animation_player.play("searching")
	)
	tween.play()


func _set_alerted(is_alerted : bool):
	alerted = is_alerted
	if is_alerted:
		signal_alerted.emit()

func _physics_process(delta):
	#pass
	if sees_player:
		alert_time_left -= delta
		if alert_time_left <= 0.0:
			_set_alerted(true)
		
		rotate_node.look_at(
			PlayerManager.character.global_transform.origin,
			Vector3(0, 0, 1),
			true
		)
		rotate_node.rotation_degrees.z = 0
		
	var eyeball_material = eyeball.get_active_material(0) as StandardMaterial3D
	var weight = 0
	if sees_player:
		weight = (alert_time - alert_time_left) / alert_time
	assert(weight < 1.0)
	eyeball_material.albedo_color = Color.YELLOW.lerp(Color.RED, weight)
	eyeball_material.emission = Color.YELLOW.lerp(Color.RED, weight)
	#eyeball.mesh.surface_set_material(0, eyeball_material)
		
			#Vector3(
				#PlayerManager.character.global_transform.origin.x,
				#rotate_node.global_transform.origin.y,
				#PlayerManager.character.global_transform.origin.z
			#), 
			#Vector3(0, 0, 1)
		#)
		#rotate_node.rotate(Vector3.UP, 30)
