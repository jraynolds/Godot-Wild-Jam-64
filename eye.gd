extends Node3D

@onready var raycaster : RayToPlayer = $RayToPlayer
@onready var meshes : Array[MeshInstance3D]

var sees_player : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	meshes = [ $MeshInstance3D as MeshInstance3D, $MeshInstance3D2 as MeshInstance3D ]
	raycaster.signal_player_found.connect(func(): sees_player = true)
	raycaster.signal_player_lost.connect(func(): sees_player = false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if sees_player:
		for mesh in meshes:
			mesh.look_at(PlayerManager.character.global_position)
