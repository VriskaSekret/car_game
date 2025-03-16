extends Label
@onready var car: RigidBody3D = $"../../../Car"
@onready var dababy_car: RigidBody3D = $"../../../DababyCar"
@onready var speedometer: Label = $"."
@onready var player

func _ready() -> void:
	if !player:
		if Global.car == 0:
			player = car
		elif Global.car == 1:
			player = dababy_car

func _process(delta):
	speedometer.text = " Speed: %skm/h " % int(round((player.linear_velocity.length()) * 2))
