extends Area2D

@export var targets: Array[Node]
@export var is_enabled: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body: Node2D) -> void:
	if not is_enabled:
		return
	if not body.is_in_group("player"):
		return
	for target in targets:
		if target.is_in_group("switchable"):
			target.switch()
