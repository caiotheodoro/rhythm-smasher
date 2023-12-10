extends Node2D

@onready var heartsContainer = $CanvasLayer/hearthsContainer
@onready var player = $Game/Player
@onready var boss = $Game/Boss
@onready var conductor = $Game/Conductor
@onready var game = $Game
# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.currentBoss)
	player.set_max_health(6)
	boss.set_max_health(Global.currentBoss.life)
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	game.play_music(Global.currentBoss.music)
	conductor.play_music(Global.currentBoss.music)
	conductor.change_speed(Global.currentBoss.speed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
