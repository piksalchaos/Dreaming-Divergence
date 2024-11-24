extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
var credits_scene := preload("res://scenes/credits.tscn")

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_packed(credits_scene)
