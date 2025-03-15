extends Label
@onready var car: RigidBody3D = $"../Car"
@onready var speedometer: Label = $"."


func _process(delta):
	speedometer.text = " Speed: %skm/h " % int(round((car.linear_velocity.length()) * 2))
