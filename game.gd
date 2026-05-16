extends Node

var rings = [BAMBOO_RING, DIAMOND_RING, FLOWER_RING, GOLD_RING, SILVER_RING]

const BAMBOO_RING = preload("uid://c540rjjt0ewjh")
const DIAMOND_RING = preload("uid://guhq4mubk0pr")
const FLOWER_RING = preload("uid://b3hwix1pm08dm")
const GOLD_RING = preload("uid://dikicfnmindx8")
const SILVER_RING = preload("uid://dlqt56shlagc0")

const INVENTORY = "res://scenes/player_scenes/inventory.tscn"
const KNIFE_GAME = "res://scenes/player_scenes/knife_game.tscn"
const MENU = "res://scenes/player_scenes/menu.tscn"
const SHOP = "res://scenes/player_scenes/shop.tscn"
const WIN_LOSE_SCREEN = "res://scenes/player_scenes/win_lose_screen.tscn"

var dragging = false

var current_score = 0

var currency = 100

var shop_rolled = false

var item_1
var item_2
var item_3

var inv_slot_1 = null
var inv_slot_2 = null
var inv_slot_3 = null
var inv_slot_4 = null

var shop_slot_1 = null
var shop_slot_2 = null
var shop_slot_3 = null

var inventory_space = 5

var current_round = 1

var ante = 1
var scale = 1.5

var win = null

var spawn_rings = false
