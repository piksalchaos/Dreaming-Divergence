extends StaticBody2D

const CLOSED_FRAME: int = 0
const OPEN_FRAME: int = 1

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var inner_body_detector: Area2D = $InnerBodyDetector

@export var is_open = true

func _ready() -> void:
	if is_open:
		open()
	else:
		close()
		
	

func open():
	is_open = true
	collision_shape_2d.set_deferred("disabled", true)
	sprite_2d.frame = OPEN_FRAME

func close():
	is_open = false
	collision_shape_2d.set_deferred("disabled", false)
	sprite_2d.frame = CLOSED_FRAME

func switch():
	if is_open:
		close()
	else:
		open()
