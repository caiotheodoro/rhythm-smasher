extends Node2D

var combo = 0
var score = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var _is_full_screen = false
var bonus_value = 0
var isImoral = false
var doubleDamage = false
var boss_bleed = false

var bosses: Array = [
	{
	id = 0, 
	name= "Gatuncio",
	music = "res://Songs/home head First.mp3",
	 speed = 72,
	 life = 1, #5500
	sprite= "parameters/conditions/idle",
	 timer = {speed = 72, when=1, name="" },
	conductor= {first = 30, second = 65, third = 80},
	cover = "res://Sprites/boards/violoncelo.png",
	hasDetails = false,
	items = {item1=0, item2=0, item3=0},
	hasTimeHability = false,
	hasSmash = false
	},
	{
	id = 1, 
	name= "Bola-teria",
	music = "res://Songs/lil mori.mp3",
	 speed = 95,
	 life = 1, #4600
	sprite= "parameters/conditions/idle2",
	 timer = {speed = 105, when=30, name="" },
	conductor= {first = 36, second = 65, third = 80},
	cover = "res://Sprites/boards/demon.png",
	hasDetails = true,
	items = {item1=0, item2=1, item3=0},
	hasTimeHability = true,
	hasSmash = false
	},
	{id = 2,
	name= "Corvock",
	music = "res://Songs/oceandrive.mp3", 
	speed = 105,
	life = 8500, #8500
	sprite= "parameters/conditions/idle3",
	timer = {speed = 110, when=40, name="" },
	conductor= {first = 49, second = 65, third = 80},
	items = {item1=1, item2=1, item3=1},
	cover = "res://Sprites/boards/crow.png",
	hasDetails = true,
	hasTimeHability = true,
	hasSmash = true,
	smashTimer = "2:50"
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
