extends Node2D

@onready var heartsContainer = $CanvasLayer/hearthsContainer
@onready var player = $Game/Player
@onready var boss = $Game/Boss
@onready var conductor = $Game/Conductor
@onready var game = $Game
@onready var timer = $Game/Timer
func _ready():
	print(Global.currentBoss)
	player.set_max_health(6)
	boss.set_max_health(Global.currentBoss.life)
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	game.play_music(Global.currentBoss.music)
	boss.set_boss_sprite(Global.currentBoss.sprite)
	conductor.play_music(Global.currentBoss.music)
	conductor.change_speed(Global.currentBoss.speed)
	timer.wait_time = Global.currentBoss.timer.when
	timer.start()
	
	
func _process(delta):
	pass


