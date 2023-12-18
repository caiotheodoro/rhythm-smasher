extends Control


@onready var final = $FinalScore
@onready var audio = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	audio.play()
	final.text = str(Global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/utfpr_start_screen.tscn")

