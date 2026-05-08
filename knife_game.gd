extends Node2D

const WIN_LOSE_SCREEN : PackedScene = preload("uid://dy145eblj1p3m")

@onready var knife_game_anim: AnimatedSprite2D = $KnifeGameAnim

@onready var current_key_needed_label: Label = $CanvasLayer/NeededKeyHbox/CurrentKeyNeededLabel
@onready var currency_amount_label: Label = $CurrencyAmountLabel
@onready var needed_keys_label: Label = $CanvasLayer/NeededKeysHbox/NeededKeysLabel
@onready var current_ante_label: Label = $CanvasLayer/AntesHbox/CurrentAnteLabel
@onready var current_enemy_label: Label = $CanvasLayer/CurrentEnemyHbox/CurrentEnemyLabel
@onready var needed_score_label: Label = $CanvasLayer/NeededScoreHbox/NeededScoreLabel
@onready var current_score_label: Label = $CanvasLayer/CurrentScoreHbox/CurrentScoreLabel
@onready var timer_label: Label = $CanvasLayer/TimerHbox/TimerLabel
@onready var timer: Timer = $Timer
@onready var reward_label: Label = $RewardLabel
@onready var combo_timer: Timer = $ComboTimer
@onready var combo_timer_label: Label = $Label


var default_combo_time = 5
var default_combo_increase = 5
var combo_time : float
var combo_scaling = 4
var combo_decrease : float
var combo_increase : float



var needed_keys = []
var hurt_keys = ["a", "w", "s", "d", "space"]
var random_key_options = ["a", "w", "s", "d"]
var current_needed_key = 0
var needed_keys_length = 8


var small_score = 100
var big_score = 200
var boss_score = 300


var needed_score = 0

var already_ran = false


func _ready() -> void:
	combo_increase = default_combo_increase
	combo_time = default_combo_time
	combo_timer.wait_time = combo_time
	combo_timer.start()
	Game.current_score = 0
	randomize_keys()
	enemies()
	
	needed_score_label.text = str(needed_score)
	current_score_label.text = str(Game.current_score)
	current_ante_label.text = str(Game.ante)



func _process(_delta: float) -> void:
	combo_timer_label.text = str(snappedf(combo_timer.time_left, 0.01))
	currency_amount_label.text = str(Game.currency)
	timer_label.text = str(timer.time_left)
	if Game.current_score >= needed_score and !already_ran:
		if Game.current_round != 3:
			Game.currency += 10
			Game.shop_rolled = false
			Game.current_round += 1
			Game.win = true
			already_ran = true
		else:
			Game.currency += 15
			Game.shop_rolled = false
			Game.current_round = 1
			Game.ante += 1
			Game.win = true
			already_ran = true
	
	
	current_score_label.text = str(Game.current_score)
	key_pressing()


func randomize_keys():
	needed_keys = []
	while needed_keys.size() < needed_keys_length:
		needed_keys.append(random_key_options[randi_range(0, random_key_options.size() - 1)])
		needed_keys.append("space")
	needed_keys.append("end")
	current_key_needed_label.text = needed_keys[current_needed_key]
	needed_keys_label.text = str(needed_keys)


func key_pressing():
	if current_needed_key == needed_keys_length:
		current_needed_key = 0
		randomize_keys()
		combo_decrease = combo_increase / combo_scaling
		combo_increase -= combo_decrease
		combo_timer.wait_time = combo_timer.time_left + combo_increase
		combo_timer.stop()
		combo_timer.start()

	elif needed_keys.size() - 1 >= current_needed_key:
		if Input.is_action_just_pressed(needed_keys[current_needed_key]):

			Game.current_score += 1
			if current_needed_key == 0:
				knife_game_anim.play("stab_index")
				if Game.slot_1 != null:
					if Game.slot_1.trigger == Game.slot_1.triggers.HIT:
						Game.slot_1.action()
						reward_label.text = Game.slot_1.trigger_text

			if current_needed_key == 2:
				knife_game_anim.play("stab_middle")
				if Game.slot_2 != null:
					if Game.slot_2.trigger == Game.slot_2.triggers.HIT:
						Game.slot_2.action()
						reward_label.text = Game.slot_2.trigger_text

			if current_needed_key == 4:
				knife_game_anim.play("stab_ring")
				if Game.slot_3 != null:
					if Game.slot_3.trigger == Game.slot_3.triggers.HIT:
						Game.slot_3.action()
						reward_label.text = Game.slot_3.trigger_text

			if current_needed_key == 6:
				knife_game_anim.play("stab_pinky")
				if Game.slot_4 != null:
					if Game.slot_4.trigger == Game.slot_4.triggers.HIT:
						Game.slot_4.action()
						reward_label.text = Game.slot_4.trigger_text

			if needed_keys[current_needed_key] == "space":
				if current_needed_key == 1:
					knife_game_anim.play_backwards("stab_index")
				if current_needed_key == 3:
					knife_game_anim.play_backwards("stab_middle")
				if current_needed_key == 5:
					knife_game_anim.play_backwards("stab_ring")
				if current_needed_key == 7:
					knife_game_anim.play_backwards("stab_pinky")
			current_needed_key += 1
			current_key_needed_label.text = needed_keys[current_needed_key]

		else:
			for i in hurt_keys:
				if Input.is_action_just_pressed(i):
					print("ouchie")


func enemies():
	if Game.current_round == 1:
		needed_score = small_score * Game.ante * Game.scale
		current_enemy_label.text = "small enemy"
	elif Game.current_round == 2:
		needed_score = big_score * Game.ante * Game.scale
		current_enemy_label.text = "big enemy"
	elif Game.current_round == 3:
		needed_score = boss_score * Game.ante * Game.scale
		current_enemy_label.text = "boss"


func _on_timer_timeout() -> void:
	if Game.slot_1 != null:
		if Game.slot_1.activations >= Game.slot_1.activation_time:
			Game.slot_1.death_activations += 1
		Game.slot_1.activations += 1
		if Game.slot_1.trigger == Game.slot_1.triggers.ROUND:
			Game.slot_1.action()

	if Game.slot_2 != null:
		if Game.slot_2.activations >= Game.slot_2.activation_time:
			Game.slot_2.death_activations += 1
		Game.slot_2.activations += 1
		if Game.slot_2.trigger == Game.slot_2.triggers.ROUND:
			Game.slot_2.action()

	if Game.slot_3 != null:
		if Game.slot_3.activations >= Game.slot_3.activation_time:
			Game.slot_3.death_activations += 1
		Game.slot_3.activations += 1
		if Game.slot_3.trigger == Game.slot_3.triggers.ROUND:
			Game.slot_3.action()

	if Game.slot_4 != null:
		if Game.slot_4.activations >= Game.slot_4.activation_time:
			Game.slot_4.death_activations += 1
		Game.slot_4.activations += 1
		if Game.slot_4.trigger == Game.slot_4.triggers.ROUND:
			Game.slot_4.action()

	get_tree().change_scene_to_file("res://scenes/win_lose_screen.tscn")


func _on_combo_timer_timeout() -> void:
	print("combo end")
	combo_increase = default_combo_increase
	combo_timer.wait_time = default_combo_time
	combo_timer.start()
