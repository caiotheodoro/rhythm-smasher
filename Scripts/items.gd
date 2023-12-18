extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var item1 = $Item1/Item1
@onready var item2 = $Item2/Item2
@onready var item3 = $Item3/Item3
@onready var item1_timer = $Item1/Timer1
@onready var item2_timer = $Item2/Timer2
@onready var immortalCounter = $Item2/Counter
func _ready():
	item1.visible = true
	item2.visible = true
	item1.play("item1")
	item2.play("item2")
	item3.play("item3")
	if Global.currentBoss.items.item1 != 1:
		item1.visible = false
	if Global.currentBoss.items.item2 != 1:
		item2.visible = false
	if Global.currentBoss.items.item3 != 1:
		item3.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.currentBoss.items.item1 != 0 and Input.is_action_just_pressed("item1")):
		_on_item_1_pressed()
	if(Global.currentBoss.items.item2 != 0 and Input.is_action_just_pressed("item2")):
		_on_item_2_pressed()
	if(Global.currentBoss.items.item3 != 0 and Input.is_action_just_pressed("item3")):
		_on_item_3_pressed()
	if item2_timer.time_left != 0:
		immortalCounter.text = str(int(item2_timer.time_left))
	else:
		immortalCounter.text = ""




func _on_item_1_pressed():
	if Global.currentBoss.items.item1 != 0:
		item1.visible = false
		item1_timer.start()
		Global.bonus_value = 2


func _on_timer_1_timeout():
	Global.bonus_value = 0


func _on_timer_2_timeout():
	Global.isImoral = false
	item2_timer.stop()


func _on_item_2_pressed():
	if Global.currentBoss.items.item2 != 0:
		item2.visible = false
		item2_timer.start()
		Global.isImoral = true

func _on_item_3_pressed():
	if Global.currentBoss.items.item3 != 0:
		item3.visible = false
		Global.boss_bleed = true
