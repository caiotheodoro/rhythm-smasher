extends CharacterBody2D
class_name Boss

class BossType:
	var id: int
	var music: String
	var speed: float

const SPEED = 0
const JUMP_VELOCITY = -400.0

signal boss_health_changed

	

#@export var bosses: Array = [
#	{id = 0, music = "res://Songs/lights.mp3", speed = 80, life = 5},
#	{id = 1, music = "res://Songs/starboy.mp3", speed = 100, life = 15},
#	{id = 2, music = "res://Songs/blue.mp3", speed = 140, life = 30},
#]
#@export var currentBoss: Dictionary  = bosses[0]
@export var boss_health = 0
@export var current_boss_health: int = boss_health
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var explosionTime = $ExplosionTime
@onready var explosion = $Explosion
@onready var defeatText = $DefeatText
@onready var bossBody = $Body
@onready var successAudio = $Success
@onready var stab = $Stab
@onready var nextScene = $NextScene
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var end_boss_callback: Callable


func _ready():
	bossBody.visible = true
	defeatText.visible = false
	
	
func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func hurt_by_player(multiplier: int):
	if Global.boss_bleed:
		current_boss_health -= 350
		Global.boss_bleed = false
		stab.play()
	current_boss_health -= 1 * multiplier
	if current_boss_health <= 0:
		explosion.visible = true
		defeatText.visible = true
		explosionTime.start()
		explosion.play("default")
		successAudio.play()
		nextScene.start()
		if end_boss_callback != null:
			end_boss_callback.call()
		
		
#		get_tree().change_scene_to_file("res://Scenes/next_level.tscn")
		var next_boss_id = Global.currentBoss.id + 1

		if next_boss_id < Global.bosses.size():
			Global.next_boss()
			current_boss_health = Global.currentBoss.life
		else:
			get_tree().change_scene_to_file("res://Scenes/End.tscn")
		
	boss_health_changed.emit()
#	update_bar()

#func update_bar():
#	bossHealthBar.update(current_boss_health * 100 / boss_health)
func set_boss_sprite(sprite: String):
	animation_tree[sprite] = true

func set_max_health(health: int):
	boss_health = health
	current_boss_health = health


func _on_explosion_time_timeout():
	bossBody.visible = false
	explosion.visible = false
	

func _on_next_scene_timeout():
	get_tree().change_scene_to_file("res://Scenes/next_level.tscn")
	
func set_end_boss_callback(callback: Callable):
	end_boss_callback = callback
