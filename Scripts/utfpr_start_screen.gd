extends Control

@onready var anim = $AnimatedSprite2D
@onready var trans = $Transition
# Called when the node enters the scene tree for the first time.
func _ready():
	trans.play("fade_out")
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_animation_finished(anim_name):
	trans.play("fade_in")
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
