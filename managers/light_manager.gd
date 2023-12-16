extends Control

@onready var light_texture : TextureRect = $PanelContainer/Panel/LightTexture

var light_amount : float = 0.0

signal signal_light_amount_changed(prev_amount: float, new_amount: float)

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	GameManager.signal_scene_loaded.connect(_on_scene_loaded)


func add_light(addition: float):
	set_light_amount(light_amount + addition)


func set_light_amount(amount: float):
	var prev_light_amount = light_amount
	light_amount = min(1.0, amount)
	light_amount = max(0.0, amount)
	light_texture.self_modulate.v = light_amount
	signal_light_amount_changed.emit(prev_light_amount, light_amount)


func _on_scene_loaded(scene: PackedScene):
	light_amount = 0.0
	visible = true
