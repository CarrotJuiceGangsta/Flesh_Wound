extends Node2D

var ring_slot_1_position = Vector2(600.0, 500.0)
var ring_slot_2_position = Vector2(850.0, 500.0)
var ring_slot_3_position = Vector2(1100.0, 500.0)
var ring_slot_4_position = Vector2(1350.0, 500.0)

@export var ring : Resource
@onready var ring_texture: Sprite2D = $RingTexture
@onready var ring_info: Label = $RingInfo

@export var ring_hover_scale : Vector2
@export var ring_default_scale : Vector2
@export var ring_inventory_slot : int

var ring_lerp_speed = 0.3

var ring_default_position : Vector2

var ring_dragging = false
var ring_hovering = false

func _process(_delta: float) -> void:
	if ring_hovering == true:
		if Input.is_action_just_pressed("lmb"):
			ring_dragging = true
			Game.dragging = true
			z_index = 1
			ring_info.visible = false
	if Input.is_action_just_released("lmb"):
		ring_dragging = false
		Game.dragging = false
		z_index = 0
		ring_texture.scale = ring_default_scale

	if ring_dragging == true:
		position = lerp(position, get_global_mouse_position(), ring_lerp_speed)
	
	if ring_dragging == false:
		position = lerp(position, ring_default_position, ring_lerp_speed)


func _ready() -> void:
	if ring_inventory_slot == 0:
		ring = Game.slot_1
		position = ring_slot_1_position
	elif ring_inventory_slot == 1:
		ring = Game.slot_2
		position = ring_slot_2_position
	elif ring_inventory_slot == 2:
		ring = Game.slot_3
		position = ring_slot_3_position
	elif ring_inventory_slot == 3:
		ring = Game.slot_4
		position = ring_slot_4_position
	print(position)

	ring_default_position = position

	if ring != null:
		ring_texture.texture = ring.shop_texture
		ring_info.text = ring.description


func _on_area_2d_mouse_entered() -> void:
	ring_hovering = true
	if Game.dragging == false:
		ring_texture.scale = ring_hover_scale
		ring_info.visible = true




func _on_area_2d_mouse_exited() -> void:
	ring_hovering = false
	if Game.dragging == false:
		ring_texture.scale = ring_default_scale
		ring_info.visible = false
