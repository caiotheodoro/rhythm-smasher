extends Node2D
@onready var anim = $AnimatedSprite2D
@onready var anim2 = $AnimatedSprite2D/AnimatedSprite2D


func _ready():
	anim.play("default")
	anim2.play("default")
	
	
func _on_start_button_button_down():
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db($HSlider.value))
	if get_tree().change_scene_to_file("res://Scenes/next_level.tscn") != OK:
		print("erro")
		



func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://Scenes/next_level.tscn")


func _on_instrucoes_pressed():
	get_tree().change_scene_to_file("res://Scenes/instruction.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_sair_pressed():
	get_tree().quit()
