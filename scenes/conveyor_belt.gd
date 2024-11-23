class_name ConveyorBelt extends StaticBody2D

@export var speed: float = 50
@export var is_direction_right = true
@export var is_enabled = true

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.flip_h = not is_direction_right

func get_velocity():
	if not is_enabled:
		return 0
	if is_direction_right:
		return speed
	else:
		return -speed

func switch():
	is_enabled = not is_enabled
