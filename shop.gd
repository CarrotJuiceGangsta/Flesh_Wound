extends Control


@onready var currency_amount_label: Label = $CurrencyAmountLabel

var current_ring

var no_item_duplicates = true
var no_rarity_duplicates = false


var item_rarity

var shop_slots = 3

enum rarities {
	COMMON,
	UNCOMMON,
	RARE,
	ETHEREAL,
}

var rings_to_pick_from = []


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
		if i.rarity == item_rarity and i != Game.item_1 and i != Game.item_2 and i != Game.item_3 and i != Game.shop_slot_1 and i != Game.shop_slot_2 and i != Game.shop_slot_3:
			rings_to_pick_from.append(i)
	current_ring = rings_to_pick_from.pick_random()
	rings_to_pick_from.clear()
	if ring == 0:
		Game.shop_slot_1 = current_ring
		print("Game.shop_slot_1: " + str(Game.shop_slot_1))
	if ring == 1:
		Game.shop_slot_2 = current_ring
		print("Game.shop_slot_2: " + str(Game.shop_slot_2))
	if ring == 2:
		Game.shop_slot_3 = current_ring
		print("Game.shop_slot_3: " + str(Game.shop_slot_3))



func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/player_scenes/menu.tscn")




func _on_buy_area_area_entered(area: Area2D) -> void:
	if area.owner != Control:
		if area.owner.ring.cost <= Game.currency:
			if Game.inv_slot_1 == null:
				Game.inv_slot_1 = area.owner.ring
				print("inv slot 1: " + str(Game.inv_slot_1))
				Game.currency -= area.owner.ring.cost

			elif Game.inv_slot_2 == null:
				Game.inv_slot_2 = area.owner.ring
				print("inv slot 2: " + str(Game.inv_slot_2))
				Game.currency -= area.owner.ring.cost

			elif Game.inv_slot_3 == null:
				Game.inv_slot_3 = area.owner.ring
				print("inv slot 3: " + str(Game.inv_slot_3))
				Game.currency -= area.owner.ring.cost

			elif Game.inv_slot_4 == null:
				Game.inv_slot_4 = area.owner.ring
				print("inv slot 4: " + str(Game.inv_slot_4))
				Game.currency -= area.owner.ring.cost

			else:
				print("Inventory Full!")
		else:
			print("Your Broke!")
		currency_amount_label.text = str(Game.currency)
