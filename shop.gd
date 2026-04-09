extends Control

const BAMBOO_RING = preload("uid://c540rjjt0ewjh")
const DIAMOND_RING = preload("uid://guhq4mubk0pr")

@onready var currency_amount_label: Label = $CanvasLayer/CurrencyHBox/CurrencyAmountLabel

@onready var left_ring: Node2D = $CanvasLayer/HBoxContainer/LeftRingBase
@onready var middle_ring: Node2D = $CanvasLayer/HBoxContainer/MiddleRingBase
@onready var right_ring: Node2D = $CanvasLayer/HBoxContainer/RightRingBase


var no_item_duplicates = true
var no_rarity_duplicates = false

var item

var item_rarity

var shop_slots = 3

var rarities = ["common", "uncommon", "rare", "ethereal"]


var common_rings = [BAMBOO_RING]
var uncommon_rings = [DIAMOND_RING]

#var rings = {
	#c_1 = {
		#NAME = "c_1",
		#DESCRIPTION = "The first common ring.",
		#PRICE = 4,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "common"
		#},
#
	#c_2 = {
		#NAME = "c_2",
		#DESCRIPTION = "The second common ring.",
		#PRICE = 4,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "common"
		#},
#
	#c_3 = {
		#NAME = "c_3",
		#DESCRIPTION = "The third common ring.",
		#PRICE = 4,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "common"
		#},
#
#
	#u_1 = {
		#NAME = "u_1",
		#DESCRIPTION = "The first uncommon ring.",
		#PRICE = 6,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "uncommon"
		#},
#
#
	#u_2 = {
		#NAME = "u_2",
		#DESCRIPTION = "The second uncommon ring.",
		#PRICE = 6,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "uncommon"
		#},
#
#
	#u_3 = {
		#NAME = "u_3",
		#DESCRIPTION = "The third uncommon ring.",
		#PRICE = 6,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "uncommon"
		#},
#
#
	#r_1 = {
		#NAME = "r_1",
		#DESCRIPTION = "The first rare ring.",
		#PRICE = 8,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "rare"
		#},
#
#
	#r_2 = {
		#NAME = "r_2",
		#DESCRIPTION = "The second rare ring.",
		#PRICE = 8,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "rare"
		#},
#
#
	#r_3 = {
		#NAME = "r_3",
		#DESCRIPTION = "The third rare ring.",
		#PRICE = 8,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "rare"
		#},
#
#
	#e_1 = {
		#NAME = "e_1",
		#DESCRIPTION = "The first ethereal ring.",
		#PRICE = 10,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "ethereal"
		#},
#
#
	#e_2 = {
		#NAME = "e_2",
		#DESCRIPTION = "The second ethereal ring.",
		#PRICE = 10,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "ethereal"
		#},
#
#
	#e_3 = {
		#NAME = "e_3",
		#DESCRIPTION = "The third ethereal ring.",
		#PRICE = 10,
		#TEXTURE = null,
		#AVAILABLE = true,
		#RARITY = "ethereal"
		#},
#}

var common_chance = 64
var uncommon_chance = 30
var rare_chance = 5
var ethereal_chance = 1

func _ready() -> void:
	currency_amount_label.text = str(Game.currency)
	print(Game.currency)

	if !Game.shop_rolled:
		roll_shop()

	else:
		load_shop()


func load_shop():
	print("load shop")

func roll_shop():
	Game.shop_rolled = true
	
	for i in shop_slots:
		item_rarity = randi_range(0, 100)
		if item_rarity <= common_chance:
			item_rarity = rarities[0]
			print(item_rarity)
			print(Game.item_1)
		elif item_rarity <= uncommon_chance + common_chance:
			item_rarity = rarities[1]
		elif item_rarity <= rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[2]
		elif item_rarity == ethereal_chance + rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[3]
		
		if i == 0:
			Game.item_1 = item_rarity
		elif i == 1:
			Game.item_2 = item_rarity
		elif i == 2:
			Game.item_3 = item_rarity
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


		
	#if no_item_duplicates:
		#if Game.item_1 == "common":
			#Game.item_1 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_1)
			#print(common_items)
		#elif Game.item_1 == "uncommon":
			#Game.item_1 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_1)
		#elif Game.item_1 == "rare":
			#Game.item_1 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_1)
		#elif Game.item_1 == "ethereal":
			#Game.item_1 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_1)
		#
		#
		#if Game.item_2 == "common":
			#Game.item_2 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_2)
		#elif Game.item_2 == "uncommon":
			#Game.item_2 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_2)
		#elif Game.item_2 == "rare":
			#Game.item_2 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_2)
		#elif Game.item_2 == "ethereal":
			#Game.item_2 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_2)
		#
		#
		#if Game.item_3 == "common":
			#Game.item_3 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_3)
		#elif Game.item_3 == "uncommon":
			#Game.item_3 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_3)
		#elif Game.item_3 == "rare":
			#Game.item_3 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_3)
		#elif Game.item_3 == "ethereal":
			#Game.item_3 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_3)
	#
		#button.text = Game.item_1
		#button_2.text = Game.item_2
		#button_3.text = Game.item_3
		#
		#
		#print(common_items)
		#



func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_item_1_pressed() -> void:
	Game.inventory.append(Game.item_1)
	left_ring.text = "sold"
	print(Game.inventory)



func _on_item_2_pressed() -> void:
	middle_ring.text = "sold"


func _on_item_3_pressed() -> void:
	right_ring.text = "sold"
extends Control

@onready var button: Button = $CanvasLayer/HBoxContainer/Item_1
@onready var button_2: Button = $CanvasLayer/HBoxContainer/Item_2
@onready var button_3: Button = $CanvasLayer/HBoxContainer/Item_3
@onready var currency_amount_label: Label = $CanvasLayer/HBoxContainer3/CurrencyAmountLabel

var no_item_duplicates = true
var no_rarity_duplicates = false

var item

var item_rarity

var shop_slots = 3

var rarities = ["common", "uncommon", "rare", "ethereal"]

var common_items = ["c_1", "c_2", "c_3", "c_4", "c_5"]
var uncommon_items = ["u_1", "u_2", "u_3", "u_4", "u_5"]
var rare_items = ["r_1", "r_2", "r_3", "r_4", "r_5"]
var ethereal_items = ["e_1", "e_2", "e_3", "e_4", "e_5"]



var rings = {
	c_1 = {
		NAME = "c_1",
		DESCRIPTION = "The first common ring.",
		PRICE = 4,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "common"
		},

	c_2 = {
		NAME = "c_2",
		DESCRIPTION = "The second common ring.",
		PRICE = 4,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "common"
		},

	c_3 = {
		NAME = "c_3",
		DESCRIPTION = "The third common ring.",
		PRICE = 4,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "common"
		},


	u_1 = {
		NAME = "u_1",
		DESCRIPTION = "The first uncommon ring.",
		PRICE = 6,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "uncommon"
		},


	u_2 = {
		NAME = "u_2",
		DESCRIPTION = "The second uncommon ring.",
		PRICE = 6,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "uncommon"
		},


	u_3 = {
		NAME = "u_3",
		DESCRIPTION = "The third uncommon ring.",
		PRICE = 6,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "uncommon"
		},


	r_1 = {
		NAME = "r_1",
		DESCRIPTION = "The first rare ring.",
		PRICE = 8,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "rare"
		},


	r_2 = {
		NAME = "r_2",
		DESCRIPTION = "The second rare ring.",
		PRICE = 8,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "rare"
		},


	r_3 = {
		NAME = "r_3",
		DESCRIPTION = "The third rare ring.",
		PRICE = 8,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "rare"
		},


	e_1 = {
		NAME = "e_1",
		DESCRIPTION = "The first ethereal ring.",
		PRICE = 10,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "ethereal"
		},


	e_2 = {
		NAME = "e_2",
		DESCRIPTION = "The second ethereal ring.",
		PRICE = 10,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "ethereal"
		},


	e_3 = {
		NAME = "e_3",
		DESCRIPTION = "The third ethereal ring.",
		PRICE = 10,
		TEXTURE = null,
		AVAILABLE = true,
		RARITY = "ethereal"
		},
}

var common_chance = 64
var uncommon_chance = 30
var rare_chance = 5
var ethereal_chance = 1

func _ready() -> void:
	currency_amount_label.text = str(Game.currency)
	print(Game.currency)

	if !Game.shop_rolled:
		roll_shop()

	else:
		load_shop()


func load_shop():
	print("load shop")
	button.text = str(Game.item_1)
	button_2.text = str(Game.item_2)
	button_3.text = str(Game.item_3)

func roll_shop():
	Game.shop_rolled = true
	
	for i in shop_slots:
		item_rarity = randi_range(0, 100)
		if item_rarity <= common_chance:
			item_rarity = rarities[0]
			print(item_rarity)
			print(Game.item_1)
		elif item_rarity <= uncommon_chance + common_chance:
			item_rarity = rarities[1]
		elif item_rarity <= rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[2]
		elif item_rarity == ethereal_chance + rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities[3]
		
		if i == 0:
			Game.item_1 = item_rarity
		elif i == 1:
			Game.item_2 = item_rarity
		elif i == 2:
			Game.item_3 = item_rarity
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


		
	#if no_item_duplicates:
		#if Game.item_1 == "common":
			#Game.item_1 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_1)
			#print(common_items)
		#elif Game.item_1 == "uncommon":
			#Game.item_1 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_1)
		#elif Game.item_1 == "rare":
			#Game.item_1 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_1)
		#elif Game.item_1 == "ethereal":
			#Game.item_1 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_1)
		#
		#
		#if Game.item_2 == "common":
			#Game.item_2 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_2)
		#elif Game.item_2 == "uncommon":
			#Game.item_2 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_2)
		#elif Game.item_2 == "rare":
			#Game.item_2 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_2)
		#elif Game.item_2 == "ethereal":
			#Game.item_2 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_2)
		#
		#
		#if Game.item_3 == "common":
			#Game.item_3 = common_items[randi_range(0, common_items.size() - 1)]
			#common_items.erase(Game.item_3)
		#elif Game.item_3 == "uncommon":
			#Game.item_3 = uncommon_items[randi_range(0, uncommon_items.size() - 1)]
			#uncommon_items.erase(Game.item_3)
		#elif Game.item_3 == "rare":
			#Game.item_3 = rare_items[randi_range(0, rare_items.size() - 1)]
			#rare_items.erase(Game.item_3)
		#elif Game.item_3 == "ethereal":
			#Game.item_3 = ethereal_items[randi_range(0, ethereal_items.size() - 1)]
			#ethereal_items.erase(Game.item_3)
	#
		#button.text = Game.item_1
		#button_2.text = Game.item_2
		#button_3.text = Game.item_3
		#
		#
		#print(common_items)
		#



func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_item_1_pressed() -> void:
	Game.inventory.append(Game.item_1)
	button.text = "sold"
	print(Game.inventory)



func _on_item_2_pressed() -> void:
	button_2.text = "sold"


func _on_item_3_pressed() -> void:
	button_3.text = "sold"
