extends Label

@onready var score: Label = $"."

func _process(delta):
	score.text = " Score: %s " % Global.score
