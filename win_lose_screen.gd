extends Control

@onready var label: Label = $CanvasLayer/HBoxContainer/Label

func _ready() -> void:
	if Game.win:
		label.text = "YOU WIN!!!"
		Game.win = null
	else:
		label.text = "YOU LOSE!!!"
		Game.win = null


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(Game.MENU)
