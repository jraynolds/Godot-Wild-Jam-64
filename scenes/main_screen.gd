extends Control
class_name MainScreen

@onready var play_button : Button = $PanelContainer/VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	play_button.pressed.connect(_on_play_pressed)


func _on_play_pressed():
	GameManager.start_tutorial()
