extends CharacterBody2D
class_name Player

signal healthChanged

@export var char_speed : float = 0
@export var maxHealth = 3
@export var currentHealth: int = maxHealth
const JUMP_VELOCITY = -400.0

@onready var animation_tree: AnimationTree = $AnimationTree
var was_in_air : bool = false

var direction: Vector2 = Vector2.ZERO
var animation_locked : bool = false

func _ready():
	animation_tree.active = true

func _process(delta):
	update_animation_parameters()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")




func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
		
		if was_in_air == true:
			land()
			
		was_in_air = false

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	direction = Input.get_vector("left_player","right_player","up_player","down_player").normalized()
	
	if direction:
		velocity = direction * char_speed
	else:
#		velocity.x = move_toward(velocity.x, 0, char_speed)
		velocity = Vector2.ZERO

	move_and_slide()
	
func land():
	animation_locked = true
	
func update_animation_parameters():

	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
	else:
		animation_tree["parameters/conditions/idle"] = false
			
	if(Input.is_action_just_pressed("jump")):
		animation_tree["parameters/conditions/jump"] = true
	else:
		animation_tree["parameters/conditions/jump"] = false
		
	if(Input.is_action_just_pressed("right_dash")):
		animation_tree["parameters/conditions/right"] = true
	else:
		animation_tree["parameters/conditions/right"] = false
		
	if(Input.is_action_just_pressed("hide")):
		animation_tree["parameters/conditions/hide"] = true
	else:
		animation_tree["parameters/conditions/hide"] = false
	
	if(Input.is_action_just_pressed("left")):
		animation_tree["parameters/conditions/left"] = true
	else:
		animation_tree["parameters/conditions/left"] = false
			
	if(direction != Vector2.ZERO):
		animation_tree["parameters/Jump/blend_position"] = direction
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Right/blend_position"] = direction
		animation_tree["parameters/Hide/blend_position"] = direction
		animation_tree["parameters/Left/blend_position"] = direction

func set_max_health(health: int):
	maxHealth = health
	currentHealth = health

func hurted():
	currentHealth -=1
	if currentHealth == 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
		currentHealth = maxHealth
	healthChanged.emit(currentHealth)
