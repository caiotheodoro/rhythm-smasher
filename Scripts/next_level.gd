extends Control

# Called when the node enters the scene tree for the first time.

@onready var finalScore = $FinalScore
@onready var label2 = $Label2
@onready var bossImage = $BossImage
@onready var bossName = $bossName

func _ready():
	bossImage.texture = load(Global.currentBoss.cover)
	bossName.text = str(Global.currentBoss.name)
	if(Global.score > 0):
		label2.text = "Score atual:"
		finalScore.text = str(Global.score)
	else:
		label2.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_next_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")
