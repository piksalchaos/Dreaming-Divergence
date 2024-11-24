class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@export var enabled: bool = true

signal killed

var is_dead = false
var death_particles = preload("res://scenes/death_particle.tscn").instantiate()
var jump = false
func _physics_process(delta: float) -> void:
	if not enabled:
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jumpSFX.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func kill():
	#prevents kill from firing signal twice
	if is_dead:
		return
	is_dead = true
	$"/root/DeathSfx".play()
	print("dies")
	death_particles.global_position = global_position
	death_particles.emitting = true
	get_parent().add_child(death_particles)
	killed.emit()
	queue_free()

func switch():
	enabled = not enabled
