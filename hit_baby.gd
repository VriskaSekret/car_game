extends Label

@onready var hit_baby: Label = $"."
@onready var last_score: int = 0
@onready var time_left: float = 10.0
func _process(delta):
	hit_baby.text = " Hit baby before: %s " % snapped(time_left, 0.1)
	if last_score == Global.score:
		time_left -= delta
	else:
		time_left = 10.0
	last_score = Global.score
