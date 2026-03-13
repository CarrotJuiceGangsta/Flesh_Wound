extends Node2D


@onready var current_key_needed_label: Label = $CurrentKeyNeeded
@onready var currency_amount: Label = $CurrencyAmount


#var needed_keys = ["a", "space", "w", "space", "s", "space", "d", "space", "end"]
var needed_keys = []
var hurt_keys = ["a", "w", "s", "d", "space"]
var random_key_options = ["a", "w", "s", "d"]
var current_needed_key = 0
var needed_keys_length = 8



func _ready() -> void:
	randomize_keys()


func _process(_delta: float) -> void:
	if current_needed_key == needed_keys_length:
		current_needed_key = 0
		current_key_needed_label.text = needed_keys[current_needed_key]
		Game.currency += 10
		currency_amount.text = str(Game.currency)
		randomize_keys()

	elif needed_keys.size() - 1 >= current_needed_key:
		if Input.is_action_just_pressed(needed_keys[current_needed_key]):
			current_needed_key += 1
			current_key_needed_label.text = needed_keys[current_needed_key]

		else:
			for i in hurt_keys:
				if Input.is_action_just_pressed(i):
					print("ouchie")


func randomize_keys():
	needed_keys = []
	while needed_keys.size() < needed_keys_length:
		needed_keys.append(random_key_options[randi_range(0, random_key_options.size() - 1)])
		needed_keys.append("space")
	needed_keys.append("end")
	current_key_needed_label.text = needed_keys[current_needed_key]
	print(needed_keys)
