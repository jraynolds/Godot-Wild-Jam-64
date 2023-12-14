extends Control

@onready var interaction_panel : Panel = $MessagePanelContainer/InteractionPanel
@onready var interaction_label : Label = $MessagePanelContainer/InteractionPanel/InteractionLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_interaction_text(text: String, show: bool = true):
	interaction_label.text = text
	interaction_panel.visible = show


func set_interaction_panel_visible(visible: bool):
	interaction_panel.visible = visible


func show_box_interaction_readout():
	set_interaction_text("Press E to grab/release.")
