extends Node

const BAMBOO_RING = preload("uid://c540rjjt0ewjh")
const DIAMOND_RING = preload("uid://guhq4mubk0pr")

var current_score = 0

var currency = 0

var shop_rolled = false

var item_1
var item_2
var item_3

var slot_1 = BAMBOO_RING
var slot_2 = DIAMOND_RING
var slot_3 = BAMBOO_RING
var slot_4 = DIAMOND_RING

var inventory_space = 5

var current_round = 1

var ante = 1
var scale = 1.5

var win = null
