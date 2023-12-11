extends Node2D

var combo = 0
var score = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var _is_full_screen = false

var bosses: Array = [
	{
		id = 0, 
		music = "res://Songs/around_the_world.mp3",
		 speed = 80,
		 life = 1420,
		sprite= "parameters/conditions/idle",
		 timer = {speed = 80, when=1, name="" }
		},
	{id = 1,
	music = "res://Songs/starboy.ogg", 
	speed = 100,
	life = 2200,
	sprite= "parameters/conditions/idle2",
	timer = {speed = 140, when=40, name="O boss usou a habilida de aceleração!" }
	},
	{id = 2, 
	music = "res://Songs/blue.ogg",
	 speed = 120,
	 life = 3520,
	sprite= "parameters/conditions/idle3",
	timer = {speed = 180, when= 60, name="O boss usou a habilida de aceleração!" }
	},
]
var currentBoss: Dictionary  = bosses[0]
var currBossIndex = 0


func next_boss():
	currBossIndex += 1
	if currBossIndex < bosses.size():
		currentBoss = bosses[currBossIndex]
	else:
		print("fim")

