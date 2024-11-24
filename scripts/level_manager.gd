extends TileMapLayer

@onready var player_1 = $Player
@onready var player_2 = $Player2

@export var next_scene: PackedScene
@export var scene_transition_time: float = 2

var num_alive_players = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_1.killed.connect(on_player_death)
	player_2.killed.connect(on_player_death)

func on_player_death():
	num_alive_players -= 1
	if num_alive_players <= 0 and next_scene:
		await get_tree().create_timer(scene_transition_time, false).timeout
		get_tree().change_scene_to_packed.call_deferred(next_scene)

func _input(event):
	if event.is_action_pressed("respawn"):
		get_tree().reload_current_scene.call_deferred()
