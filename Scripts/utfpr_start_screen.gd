extends Control

@onready var anim = $AnimatedSprite2D

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
