extends Control




func _on_knife_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/knife_game.tscn")


func _on_coin_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/shop.tscn")
