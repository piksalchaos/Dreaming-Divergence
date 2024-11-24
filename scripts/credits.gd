extends Control

const SPEED: float = 80.0
@onready var moving_point: Control = $MovingPoint
var start_menu_scene := preload("res://scenes/start_menu.tscn")

func _process(delta: float) -> void:
	moving_point.position.y -= SPEED * delta
	if moving_point.position.y < -2600:
		get_tree().change_scene_to_packed(start_menu_scene)
