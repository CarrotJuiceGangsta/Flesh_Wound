extends Control



func _on_knife_game_button_pressed() -> void:
	get_tree().change_scene_to_file(Game.KNIFE_GAME)


func _on_coin_shop_button_pressed() -> void:
	get_tree().change_scene_to_file(Game.SHOP)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		get_tree().change_scene_to_file(Game.INVENTORY)
