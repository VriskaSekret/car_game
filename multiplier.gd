extends Label

@onready var multiplier: Label = $"."

func _process(delta):
	multiplier.text = " Multiplier: %s " % Global.speed_score_multiplier
