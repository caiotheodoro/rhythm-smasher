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
	name= "Gatuncio",
	music = "res://Songs/home head First.mp3",
	 speed = 72,
	 life = 3400, #3200
	sprite= "parameters/conditions/idle",
	 timer = {speed = 72, when=1, name="" },
	conductor= {first = 30, second = 65, third = 80},
	cover = "res://Sprites/boards/violoncelo.png"
	},
	{
	id = 1, 
	name= "Bola-teria",
	music = "res://Songs/lil mori.mp3",
	 speed = 95,
	 life = 4300, #4300
	sprite= "parameters/conditions/idle2",
	 timer = {speed = 105, when=1, name="O boss usou a habilida de aceleração!" },
	conductor= {first = 36, second = 65, third = 80},
	cover = "res://Sprites/boards/demon.png"
	},
	{id = 2,
	name= "Corvock",
	music = "res://Songs/oceandrive.mp3", 
	speed = 110,
	life = 5200,
	sprite= "parameters/conditions/idle3",
	timer = {speed = 120, when=40, name="O boss usou a habilida de aceleração!" },
	conductor= {first = 49, second = 65, third = 80},
	cover = "res://Sprites/boards/crow.png"
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

