extends Node2D


@onready var current_key_needed_label: Label = $CurrentKeyNeeded
@onready var currency_amount: Label = $CurrencyAmount


var needed_keys = ["a", "space", "w", "space", "s", "space", "d", "space", "end"]
var hurt_keys = ["a", "w", "s", "d", "space"]
var current_needed_key = 0
var space_needed = false


func _ready() -> void:
	current_key_needed_label.text = needed_keys[current_needed_key]


func _process(_delta: float) -> void:
	if needed_keys[current_needed_key] == needed_keys[-1]:
		current_needed_key = 0
		current_key_needed_label.text = needed_keys[current_needed_key]
		Game.currency += 10
		currency_amount.text = str(Game.currency)

	elif needed_keys.size() - 1 >= current_needed_key:
		if Input.is_action_just_pressed(needed_keys[current_needed_key]):
			current_needed_key += 1
			current_key_needed_label.text = needed_keys[current_needed_key]

		else:
			for i in hurt_keys:
				if Input.is_action_just_pressed(i):
					print("ouchie")
