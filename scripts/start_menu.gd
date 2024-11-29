extends Control

var scene_to_load = preload("res://scenes/levels/level_1.tscn")
@onready var music = get_parent().get_node("Backgroundmusic")
func _ready() -> void:
	music.playing = false
func _on_start_button_button_down() -> void:
	music.playing = true
	get_tree().change_scene_to_packed(scene_to_load)
