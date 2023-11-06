extends Node2D

func _on_start_button_button_down():
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db($HSlider.value))
	if get_tree().change_scene_to_file("res://Levels/test_level.tscn") != OK:
		print("Error changing scene to game")
		
