extends Node3D
class_name ParentToPlayer

@export var child_to_parent : Node

@onready var player_detector : PlayerDetector = $PlayerDetector

signal signal_parented_to_player

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	player_detector.signal_player_entered.connect(_on_player_entered)


func _on_player_entered():
	print(str(len(PlayerManager.character.get_children())))
	print(child_to_parent.get_parent().name)
	child_to_parent.reparent(PlayerManager.character)
	child_to_parent.position = Vector3.ZERO
	print(child_to_parent.get_parent().name)
	print(str(len(PlayerManager.character.get_children())))
	signal_parented_to_player.emit()
	player_detector.signal_player_entered.disconnect(_on_player_entered)
