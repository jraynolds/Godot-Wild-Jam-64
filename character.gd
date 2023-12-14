extends CharacterBody3D

var player_input : PlayerInput

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	player_input = $PlayerInput as PlayerInput


func toggle_pushed(pushable : Pushable):
	player_input.toggle_pushed(pushable)
