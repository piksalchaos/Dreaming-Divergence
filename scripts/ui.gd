extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		$Menu.visible = get_tree().paused
