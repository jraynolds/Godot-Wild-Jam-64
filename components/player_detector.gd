extends Node3D
class_name PlayerDetector

@export var collision_area : Area3D
var player_entered : bool

signal signal_player_entered
signal signal_player_stay
signal signal_player_exited

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	if !collision_area:
		return
	collision_area.body_entered.connect(_on_body_entered)
	collision_area.body_exited.connect(_on_body_exited)


func _physics_process(delta):
	if player_entered:
		signal_player_stay.emit()


func _on_body_entered(enterer: Node):
	if enterer is CharacterBody3D: 
		player_entered = true
		signal_player_entered.emit()


func _on_body_exited(exiter: Node):
	if exiter is CharacterBody3D: 
		player_entered = false
		signal_player_exited.emit()


func set_collision_area(area: Area3D):
	collision_area = area
	_connect_signals()
