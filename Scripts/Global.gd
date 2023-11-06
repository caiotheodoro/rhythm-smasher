extends Node2D

var combo = 0
var score = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "N"

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
