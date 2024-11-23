extends Area2D

@export var enabled: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: PhysicsBody2D):
	if not enabled:
		return
	if body.is_in_group("player"):
		body.kill()

func switch():
	enabled = not enabled
	if not enabled:
		return
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			body.kill()
