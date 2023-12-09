extends TextureProgressBar

class_name bossHealthBar

@export var boss: Boss


func _ready():
#	boss.boss_health_changed.connect(update)
	update(100)
	pass

#
func update(newValue: int):
	value = newValue
