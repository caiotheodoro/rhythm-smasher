extends Node2D

func _on_start_button_button_down():
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db($HSlider.value))
	if get_tree().change_scene_to_file("res://Levels/test_level.tscn") != OK:
		print("erro")
		



func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")


func _on_instrucoes_pressed():
	get_tree().change_scene_to_file("res://Scenes/instruction.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_sair_pressed():
	get_tree().quit()
