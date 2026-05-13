extends Control


@onready var currency_amount_label: Label = $CurrencyAmountLabel


@onready var left_ring: Node2D = $LeftRing
@onready var middle_ring: Node2D = $MiddleRing
@onready var right_ring: Node2D = $RightRing


var current_ring

var no_item_duplicates = true
var no_rarity_duplicates = false

var item

var item_rarity

var shop_slots = 3

enum rarities {
	COMMON,
	UNCOMMON,
	RARE,
	ETHEREAL,
}

var common_rings = []
var uncommon_rings = []
var rare_rings = []
var ethereal_rings = []

var rings_to_pick_from = []

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
			item_rarity = rarities.COMMON
		elif item_rarity <= uncommon_chance + common_chance:
			item_rarity = rarities.UNCOMMON
		elif item_rarity <= rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities.RARE
		elif item_rarity == ethereal_chance + rare_chance + uncommon_chance + common_chance:
			item_rarity = rarities.ETHEREAL
		
		choose_ring(i)



func choose_ring(ring):
	for i in Game.rings:
		if i.rarity == item_rarity and i != Game.item_1 and i != Game.item_2 and i != Game.item_3:
			rings_to_pick_from.append(i)
	current_ring = rings_to_pick_from.pick_random()
	rings_to_pick_from.clear()
	if ring == 0:
		Game.item_1 = current_ring
		print("Game.item_1: " + str(Game.item_1))
	if ring == 1:
		Game.item_2 = current_ring
		print("Game.item_2: " + str(Game.item_2))
	if ring == 2:
		Game.item_3 = current_ring
		print("Game.item_3: " + str(Game.item_3))



func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/player_scenes/menu.tscn")

func _on_item_1_pressed() -> void:
	Game.inventory.append(Game.item_1)
	left_ring.text = "sold"
	print(Game.inventory)



func _on_item_2_pressed() -> void:
	middle_ring.text = "sold"


func _on_item_3_pressed() -> void:
	right_ring.text = "sold"
