extends Control

# Called when the node enters the scene tree for the first time.

@onready var finalScore = $FinalScore
@onready var label2 = $Label2
@onready var bossImage = $BossImage
@onready var bossName = $bossName
@onready var transition_animation = $Transition/Fill/animation
@onready var transition = $Transition
@onready var next = $next
@onready var transition_timer = $Transition/Timer

func _ready():
	if Global.currentBoss.hasDetails:
		next.text = "Prosseguir"
	else:
		next.text = "Batalhar!"
	transition_animation.play("transition_out")
	transition_timer.start()
	bossImage.texture = load(Global.currentBoss.cover)
	bossName.text = str(Global.currentBoss.name)
	if(Global.score > 0):
		label2.text = "Score atual:"
		finalScore.text = str(Global.score)
	else:
		label2.text = ""

func _process(delta):
	pass



func _on_next_pressed():
	if Global.currentBoss.hasDetails:
		get_tree().change_scene_to_file("res://Scenes/details.tscn")
	else:
		get_tree().change_scene_to_file("res://Levels/test_level.tscn")


func _on_timer_timeout():
	transition.visible = false
