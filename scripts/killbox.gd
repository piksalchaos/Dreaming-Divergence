extends Area2D

@export var is_enabled: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: Node2D):
	if not is_enabled:
		return
	if body.is_in_group("player"):
		body.kill()

func switch():
	is_enabled = not is_enabled
	if not is_enabled:
		return
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			body.kill()
