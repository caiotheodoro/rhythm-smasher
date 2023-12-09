extends CharacterBody2D
class_name Boss

const SPEED = 0
const JUMP_VELOCITY = -400.0

signal boss_health_changed

@export var boss_health = 1500
@export var current_boss_health: int = boss_health
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func hurt_by_player(multiplier: int):
	current_boss_health -= 1 * multiplier
	if current_boss_health <= 0:
		current_boss_health = boss_health
		
	boss_health_changed.emit()
#	update_bar()

#func update_bar():
#	bossHealthBar.update(current_boss_health * 100 / boss_health)


func set_max_health(health: int):
	boss_health = health
	current_boss_health = health
