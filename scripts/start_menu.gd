extends Control

var scene_to_load = preload("res://scenes/levels/level_1.tscn")

func _on_start_button_button_down() -> void:
	get_tree().change_scene_to_packed(scene_to_load)
