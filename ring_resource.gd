extends Resource
class_name ring_type

@export var name : String
@export var description : String
@export var rarity : rarities
@export var cost : int
@export var shop_texture : Texture2D
@export var game_texture : Texture2D

@export var reward : rewards
@export var reward_amount : int
@export var scales : bool
@export var trigger : triggers

enum rarities {
	COMMON,
	UNCOMMON,
	RARE,
	ETHEREAL,
}

enum rewards {
	CURRENCY,
	POINTS,
}

enum triggers {
	HIT,
	ROUND,
}


func action():
	if reward == rewards.CURRENCY:
		Game.currency += reward_amount
	if reward == rewards.POINTS:
		Game.current_score += reward_amount
	if scales == true:
		reward_amount += 1
	print(reward_amount)
