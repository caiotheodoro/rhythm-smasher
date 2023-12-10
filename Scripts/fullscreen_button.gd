extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.has_feature("mobile"):
		visible = false

func _process(delta):
	update_state()
	
func update_state():
	if Input.is_action_just_pressed("full_screen"):
		_toggle_fullscreen()

func _on_button_pressed():
	_toggle_fullscreen()

func _toggle_fullscreen() -> void:
	Global._is_full_screen = not Global._is_full_screen
	if Global._is_full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
