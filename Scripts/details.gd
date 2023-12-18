extends Control


# Called when the node enters the scene tree for the first time.
@onready var item1 = $Item1
@onready var item2 = $Item2
@onready var item3 = $Item3
@onready var desc_1 = $Item1/Description1
@onready var desc_2 = $Item2/Description2
@onready var desc_3 = $Item3/Description3
@onready var transition_animation = $Transition/Fill/animation
@onready var transition = $Transition
@onready var transition_timer = $Transition/Timer
@onready var bossImage = $BossImage

@onready var item_boss1 = $Hability1
@onready var item_desc1 = $Hability1/Hab1

@onready var item_boss2 = $Hability2
@onready var item_desc2 = $Hability2/Hab2
func _ready():
	transition_animation.play("transition_circle_in")
	transition_timer.start()
	bossImage.texture = load(Global.currentBoss.cover)
	if Global.currentBoss.items.item1 == 0:
		item1.visible = false
		desc_1.visible = false
	if Global.currentBoss.items.item2 == 0:
		item2.visible = false
		desc_2.visible = false
	if Global.currentBoss.items.item3 == 0:
		item3.visible = false
		desc_3.visible = false
	if not Global.currentBoss.hasTimeHability:
		item_boss1.visible = false
		item_desc1.visible = false
	if not Global.currentBoss.hasSmash:
		item_boss2.visible = false
		item_desc2.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")


func _on_timer_timeout():
	transition.visible = false
