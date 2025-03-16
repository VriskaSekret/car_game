extends Label

@onready var hit_baby: Label = $"."
@onready var last_score: int = 0
func _process(delta):
	hit_baby.text = " Hit baby before: %s " % snapped(Global.time_left, 0.1)
	Global.time_left -= delta
	if Global.time_left <= 0:
		Global.is_dead = true
