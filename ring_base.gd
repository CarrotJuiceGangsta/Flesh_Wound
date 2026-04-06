extends Node2D

@export var ring : Resource
@onready var ring_texture: Sprite2D = $RingTexture
@onready var ring_info: Label = $RingInfo

@export var ring_hover_scale : Vector2
@export var ring_default_scale : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ring_texture.texture = ring.shop_texture
	ring_info.text = ring.description


func _on_area_2d_mouse_entered() -> void:
	ring_texture.scale = ring_hover_scale
	ring_info.visible = true
func _on_area_2d_mouse_exited() -> void:
	ring_texture.scale = ring_default_scale
	ring_info.visible = false
