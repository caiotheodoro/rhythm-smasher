extends Area2D

const TARGET_Y = 150
const SPAWN_X = 85
const DIST_TO_TARGET = TARGET_Y - SPAWN_X

const LEFT_LANE_SPAWN = Vector2(260, SPAWN_X)
const CENTER_LANE_SPAWN = Vector2(290, SPAWN_X)
const RIGHT_LANE_SPAWN = Vector2(320, SPAWN_X)

var speed = 0
var hit = false

func _ready():
	pass
	
func _physics_process(delta):
	if !hit:
		position.x -= speed * delta
		if position.x < 0:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.x += speed * delta

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
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "BOM"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OK"
		$Node2D/Label.modulate = Color("997577")
		



func _on_timer_timeout():
	queue_free()
