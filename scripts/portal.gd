extends Area2D

@export var teleport_position: Vector2
@export var is_enabled: bool
func _on_body_entered(body: Node2D) -> void:
	if not is_enabled:
		return
	if body is not Player:
		return
	body.global_position = teleport_position
	pass # Replace with function body.

func switch():
	is_enabled = not is_enabled
