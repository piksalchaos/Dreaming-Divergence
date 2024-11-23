class_name Player extends CharacterBody2D

signal killed

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var floor_checker: Area2D = $FloorChecker

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	for body in floor_checker.get_overlapping_bodies():
		if body is ConveyorBelt:
			velocity.x += body.get_velocity()
	
	move_and_slide()

func kill():
	killed.emit()
	queue_free()
