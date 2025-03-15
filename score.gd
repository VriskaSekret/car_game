extends Label

@onready var score: Label = $"."

func _process(delta):
	score.text = " Score: %s " % int(Global.score)
