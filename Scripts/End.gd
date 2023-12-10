extends Node2D

func _ready():
	$ScoreNumber.text = str(Global.score)





func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/utfpr_start_screen.tscn")
