extends Control

# Called when the node enters the scene tree for the first time.

@onready var finalScore = $FinalScore
func _ready():
	finalScore.text = str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_next_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")
