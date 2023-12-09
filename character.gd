extends CharacterBody3D

var player_input : PlayerInput

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	player_input = $PlayerInput as PlayerInput


func push_begin(pushable : Pushable, move_speed_reduction : float):
	player_input.pushed_object = pushable
