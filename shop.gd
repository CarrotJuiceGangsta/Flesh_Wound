extends Control

@onready var button: Button = $CanvasLayer/HBoxContainer/Item_1
@onready var button_2: Button = $CanvasLayer/HBoxContainer/Item_2
@onready var button_3: Button = $CanvasLayer/HBoxContainer/Item_3

var no_item_duplicates = true
var no_rarity_duplicates = false

var item

var item_1
var item_2
var item_3

var item_rarity

var available_items = ["1", "2", "3", "4", "5", "6"]

var rarities = ["common", "uncommon", "rare", "ethereal"]

var common_items = ["c_1", "c_2", "c_3", "c_4", "c_5"]
var uncommon_items = ["u_1", "u_2", "u_3", "u_4", "u_5"]
var rare_items = ["r_1", "r_2", "r_3", "r_4", "r_5"]
var ethereal_items = ["e_1", "e_2", "e_3", "e_4", "e_5"]

var common_chance = 64
var uncommon_chance = 30
var rare_chance = 5
var ethereal_chance = 1

func _ready() -> void:
	for i in 3:
		item_rarity = randi_range(0, 100)
		if item_rarity <= common_chance:
			item_rarity = rarities[0]
		elif item_rarity <= uncommon_chance + common_chance:
			item_rarity = rarities[1]
		elif item_rarity <= rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[2]
		elif item_rarity == ethereal_chance + rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[3]
		
		if i == 0:
			item_1 = item_rarity
		elif i == 1:
			item_2 = item_rarity
		elif i == 2:
			item_3 = item_rarity
	
	
	if no_item_duplicates:
		if item_1 == "common":
			item = randi_range(0, common_items.size() - 1)
			button.text = common_items[item]
			common_items.remove_at(item)
		elif item_1 == "uncommon":
			item = randi_range(0, uncommon_items.size() - 1)
			button.text = uncommon_items[item]
			uncommon_items.remove_at(item)
		elif item_1 == "rare":
			item = randi_range(0, rare_items.size() - 1)
			button.text = rare_items[item]
			rare_items.remove_at(item)
		elif item_1 == "ethereal":
			item = randi_range(0, ethereal_items.size() - 1)
			button.text = ethereal_items[item]
			ethereal_items.remove_at(item)
		
		
		if item_2 == "common":
			item = randi_range(0, common_items.size() - 1)
			button_2.text = common_items[item]
			common_items.remove_at(item)
		elif item_2 == "uncommon":
			item = randi_range(0, uncommon_items.size() - 1)
			button_2.text = uncommon_items[item]
			uncommon_items.remove_at(item)
		elif item_2 == "rare":
			item = randi_range(0, rare_items.size() - 1)
			button_2.text = rare_items[item]
			rare_items.remove_at(item)
		elif item_2 == "ethereal":
			item = randi_range(0, ethereal_items.size() - 1)
			button_2.text = ethereal_items[item]
			ethereal_items.remove_at(item)
		
		
		if item_3 == "common":
			item = randi_range(0, common_items.size() - 1)
			button_3.text = common_items[item]
			common_items.remove_at(item)
		elif item_3 == "uncommon":
			item = randi_range(0, uncommon_items.size() - 1)
			button_3.text = uncommon_items[item]
			uncommon_items.remove_at(item)
		elif item_3 == "rare":
			item = randi_range(0, rare_items.size() - 1)
			button_3.text = rare_items[item]
			rare_items.remove_at(item)
		elif item_3 == "ethereal":
			item = randi_range(0, ethereal_items.size() - 1)
			button_3.text = ethereal_items[item]
			ethereal_items.remove_at(item)
	
	
	else:
		button.text = available_items[randi_range(0, available_items.size() - 1)]
		button_2.text = available_items[randi_range(0, available_items.size() - 1)]
		button_3.text = available_items[randi_range(0, available_items.size() - 1)]


func _on_item_1_button_up() -> void:
	button.text = "sold"


func _on_item_2_button_up() -> void:
	button_2.text = "sold"


func _on_item_3_button_up() -> void:
	button_3.text = "sold"
