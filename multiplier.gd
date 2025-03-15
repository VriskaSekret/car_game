extends Label

@onready var multiplier: Label = $"."

func _process(delta):
	multiplier.text = " Multiplier: %s " % snapped(Global.speed_score_multiplier, 0.01)
