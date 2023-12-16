extends Node3D
class_name Openable

@export var collision_area : Area3D
@export var openable : bool

@onready var player_detector : PlayerDetector = $PlayerDetector

# Called when the node enters the scene tree for the first time.
func _ready():
	player_detector.set_collision_area(collision_area)
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	player_detector.signal_player_entered.connect(_on_player_entered)
	player_detector.signal_player_stay.connect(_on_player_stay)
	player_detector.signal_player_exited.connect(_on_player_exited)


func _on_player_entered():
	if openable:
		OverlayManager.show_door_interaction_readout()


func _on_player_stay():
	if openable:
		OverlayManager.show_door_interaction_readout()


func _on_player_exited():
	OverlayManager.set_interaction_panel_visible(false)


func set_openable(value: bool):
	openable = value
