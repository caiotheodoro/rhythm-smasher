extends Area2D

const TARGET_Y = 164
const SPAWN_Y = -40
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(10, SPAWN_Y)
const CENTER_LANE_SPAWN = Vector2(30, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(50, SPAWN_Y)


var new_texture_path1 = "res://Sprites/game/arrow_button/left/arrow_button_left4.png"
var new_texture_path2 = "res://Sprites/game/arrow_button/right/arrow_button_right4.png"
var new_texture_path3= "res://Sprites/game/arrow_button/up/arrow_button_up4.png"

var texture_path1 = "res://Sprites/game/arrow_button/left/arrow_button_left3.png"
var texture_path2 = "res://Sprites/game/arrow_button/right/arrow_button_right3.png"
var texture_path3= "res://Sprites/game/arrow_button/up/arrow_button_up3.png"


@onready var notes = $AnimatedSprite2D

@onready var notes_animation = $AnimatedSprite2D/AnimationPlayer
var speed = 0
var hit = false

func _ready():
	notes_animation.play("normal")
	


		
func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 200:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta

func initialize(lane):
	if lane == 0:
		$AnimatedSprite2D.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite2D.frame = 1
		position = CENTER_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite2D.frame = 2
		position = RIGHT_LANE_SPAWN
	else:
		return
	
	speed = DIST_TO_TARGET / 2.0
	

func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "OTIMO!!"
		$Node2D/Label.modulate = Color("ff0000")
	elif score == 2:
		$Node2D/Label.text = "BOM"
		$Node2D/Label.modulate = Color("b93434")
	elif score == 1:
		$Node2D/Label.text = "OK"
		$Node2D/Label.modulate = Color("6e3636")
		

func change_sprite():
	if Global.bonus_value != 0:
		notes_animation.play("bonus")
		
	else:
		notes_animation.play("normal")



func _on_timer_timeout():
	queue_free()
