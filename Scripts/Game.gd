extends Node2D

var score = Global.score
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
signal healthChanged
var bpm = 115

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var should_spawn = true

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var instance
var instance2

@onready var player = $Player
@onready var boss = $Boss
@onready var bossHealthBar = $CanvasLayer2/bossHealthBar
@onready var conductor = $Conductor
@onready var bossHabilityText = $BossHability
@onready var textTimer = $TextTimer
@onready var notesTimer = $NotesTimer
@onready var error = $Error
@onready var bossDamage = $Damage
@onready var anim = $AnimatedSprite2D
@onready var damageTimer = $Damage/DamageTimer
@onready var explosion = $Boss/Explosion

@onready var au = $ArrowUp
@onready var al = $ArrowLeft
@onready var ar = $ArrowRight
func _ready():
	explosion.visible = false
	au.visible = true
	ar.visible = true
	al.visible = true
	randomize()
	should_spawn = true
	$Conductor.play_with_beat_offset(5)
	anim.visible = false
	
	# This is just for debugging purposes
	#$Conductor.play_from_beat(360, 8)
	
func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene_to_file("res://Scenes/utfpr_start_screen.tscn") != 0:
			print("erro")

func _on_conductor_measure(pos):
	if pos == 1:
		_spawn_notes(spawn_1_beat)
	elif pos == 2:
		_spawn_notes(spawn_2_beat)
	elif pos == 3:
		_spawn_notes(spawn_3_beat)
	elif pos == 4:
		_spawn_notes(spawn_4_beat)
		
func _on_conductor_beat(pos):
	song_position_in_beats = pos
	if song_position_in_beats > Global.currentBoss.conductor.first:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 78:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 162:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 228:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 322:
		spawn_1_beat = 3
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 1
	if song_position_in_beats > 388:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 396:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 404:
		Global.set_score(score)
		Global.combo = max_combo
		Global.great = great
		Global.good = good
		Global.okay = okay
		Global.missed = missed
		if get_tree().change_scene_to_file("res://Scenes/End.tscn") != OK:
			print ("erro")

func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)

func increment_score(by):
	if by > 0:
		anim.play("default")
		damageTimer.start()
		anim.visible = true
		notesTimer.start()
		combo += 1
		boss.set_end_boss_callback(end_boss)
		boss.hurt_by_player(combo)
		bossDamage.text = str(-combo)
		bossHealthBar.update(boss.current_boss_health * 100 / boss.boss_health)
			
	else:
		error.play()
		player.hurted()
		combo = 0
	
	if by == 3:
		great += 1
	elif by == 2:
		good += 1
	elif by == 1:
		okay += 1
	else:
		missed += 1
	
	
	score += by * combo
	Global.score = score
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " strike"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""
	

func end_boss():
	au.visible = false
	ar.visible = false
	al.visible = false
	conductor.stop()

func reset_combo():
	combo = 0
	$Combo.text = ""


func play_music(music: String):
	conductor.stream = load(music)
	
	await conductor.ready
	
	conductor.play()

func  _process(delta):
	$RemainTime.text = str($Conductor.get_remaining_time())

#
func _on_timer_timeout():
	print(Global.currentBoss.timer.speed)
	$Conductor.change_speed_ingame(Global.currentBoss.timer.speed)
	bossHabilityText.text = Global.currentBoss.timer.name
	textTimer.start()
	


func _on_text_timer_timeout():
	bossHabilityText.text = ""


func _on_notes_timer_timeout():
	anim.visible = false
	anim.pause()


func _on_damage_timer_timeout():
	bossDamage.text = ""

