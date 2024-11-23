extends StaticBody2D

const CLOSED_FRAME: int = 0
const OPEN_FRAME: int = 1

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var inner_body_detector: Area2D = $InnerBodyDetector

var is_open = true

func _ready() -> void:
	pass # Replace with function body.

func open():
	collision_shape_2d.disabled = true
	sprite_2d.frame = OPEN_FRAME

func close():
	collision_shape_2d.disabled = true
	sprite_2d.frame = CLOSED_FRAME
