extends Control

const INVENTORY = preload("uid://ddekmjgy26nxc")
const KNIFE_GAME = preload("uid://dvdk0ehoc50u2")
const SHOP = preload("uid://dncohmuk8arq2")

func _on_knife_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(KNIFE_GAME)


func _on_coin_shop_button_pressed() -> void:
	get_tree().change_scene_to_packed(SHOP)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		get_tree().change_scene_to_packed(INVENTORY)
