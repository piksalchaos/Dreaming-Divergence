extends Area2D

@export var targets: Array[Node]
@export var is_enabled: bool = true
@export var players_needed: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
const ON_DEPRESSED_FRAME = 0
const ON_FRAME = 1
const DISABLED_DEPRESSED_FRAME = 2
const DISABLED_FRAME = 3
const OFF_DEPRESSED_FRAME = 4
const OFF_FRAME = 5

var is_on = false

func _on_body_entered(body: Node2D) -> void:
	if not is_enabled:
		$Sprite2D.frame = DISABLED_DEPRESSED_FRAME
		return
	if not body.is_in_group("player"):
		return
	var num_players = 0
	for overlapping_body in get_overlapping_bodies():
		if overlapping_body.is_in_group("player"):
			num_players += 1
	if num_players < players_needed:
		return
	is_on = not is_on
	if is_on:
		$Sprite2D.frame = ON_DEPRESSED_FRAME
	else:
		$Sprite2D.frame = OFF_DEPRESSED_FRAME
	for target in targets:
		if is_instance_valid(target) and target.is_in_group("switchable"):
			$buttonSFX.play()
			target.switch()
	
func _on_body_exited(body: Node2D):
	var num_players = 0
	for overlapping_body in get_overlapping_bodies():
		if overlapping_body.is_in_group("player"):
			num_players += 1
	if num_players >= players_needed:
		return
	
	if is_on:
		$Sprite2D.frame = ON_FRAME
	else:
		$Sprite2D.frame = OFF_FRAME
	if not is_enabled:
		$Sprite2D.frame = DISABLED_FRAME

func switch():
	is_enabled = not is_enabled
