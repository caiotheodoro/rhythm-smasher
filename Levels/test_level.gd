extends Node2D

@onready var heartsContainer = $CanvasLayer/hearthsContainer
@onready var player = $Game/Player
@onready var boss = $Game/Boss
@onready var game = $Game/Conductor
# Called when the node enters the scene tree for the first time.
func _ready():
	player.set_max_health(6)
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	game.play_music("res://Songs/around_the_world.mp3")
	game.change_speed(80)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
