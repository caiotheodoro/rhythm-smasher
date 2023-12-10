extends Node2D

var combo = 0
var score = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "N"
var _is_full_screen = false

var bosses: Array = [
	{id = 0, music = "res://Songs/around_the_world.mp3", speed = 80, life = 6},
	{id = 1, music = "res://Songs/starboy.ogg", speed = 100, life = 1},
	{id = 2, music = "res://Songs/blue.ogg", speed = 140, life = 1},
]
var currentBoss: Dictionary  = bosses[0]
var currBossIndex = 0


func next_boss():
	currBossIndex += 1
	if currBossIndex < bosses.size():
		currentBoss = bosses[currBossIndex]
	else:
		print("fim")

func set_score(new):
	score = new
	if score > 250000:
		grade = "SSS"
	elif score > 200000:
		grade = "SS"
	elif score > 150000:
		grade = "S"
	elif score > 130000:
		grade = "A"
	elif score > 115000:
		grade = "B"
	elif score > 100000:
		grade = "C"
	elif score > 85000:
		grade = "D"
	else:
		grade = "F"
