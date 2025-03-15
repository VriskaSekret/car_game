extends Label  

@onready var fps: Label = $"."

func _process(delta):
	fps.text = " FPS: %s " % Engine.get_frames_per_second()  
