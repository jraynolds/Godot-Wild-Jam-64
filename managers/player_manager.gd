extends Node3D

var character : CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_tree().get_nodes_in_group("player")[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_character(): return character
