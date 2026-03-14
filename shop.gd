extends Control

@onready var button: Button = $HBoxContainer/Button
@onready var button_2: Button = $HBoxContainer/Button2
@onready var button_3: Button = $HBoxContainer/Button3

var no_duplicates = true

var item

var available_items = ["1", "2", "3", "4", "5", "6"]

func _ready() -> void:
	if no_duplicates:
		item = randi_range(0, available_items.size() - 1)
		button.text = available_items[item]
		available_items.remove_at(item)
		item = randi_range(0, available_items.size() - 1)
		button_2.text = available_items[item]
		available_items.remove_at(item)
		item = randi_range(0, available_items.size() - 1)
		button_3.text = available_items[item]
		available_items.remove_at(item)
	else:
		button.text = available_items[randi_range(0, available_items.size() - 1)]
		button_2.text = available_items[randi_range(0, available_items.size() - 1)]
		button_3.text = available_items[randi_range(0, available_items.size() - 1)]
