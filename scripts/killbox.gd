extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: PhysicsBody2D):
	print("boo")
	if body.is_in_group("player"):
		body.kill()
