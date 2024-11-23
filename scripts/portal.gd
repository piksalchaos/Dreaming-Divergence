class_name Portal extends Area2D

@export var teleport_position: Vector2
func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	print("Portal")
	body.global_position = teleport_position
	pass # Replace with function body.
