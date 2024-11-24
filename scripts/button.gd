extends Area2D

@export var targets: Array[Node]
@export var is_enabled: bool = true
@export var players_needed: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_body_entered(body: Node2D) -> void:
	if not is_enabled:
		return
	if not body.is_in_group("player"):
		return
	var num_players = 0
	for overlapping_body in get_overlapping_bodies():
		if overlapping_body.is_in_group("player"):
			num_players += 1
	if num_players < players_needed:
		return
	for target in targets:
		if is_instance_valid(target) and target.is_in_group("switchable"):
			$buttonSFX.play()
			target.switch()

func switch():
	is_enabled = not is_enabled
