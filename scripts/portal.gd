extends Area2D

@export var teleport_position: Vector2
#@export var is_enabled: bool
func _on_body_entered(body: Node2D) -> void:
	
	#if not is_enabled:
		#return
	if body is not Player:
		return
	$AudioStreamPlayer.play()
	body.global_position = teleport_position
	
	pass # Replace with function body. 

	#is_enabled = not is_enabled
