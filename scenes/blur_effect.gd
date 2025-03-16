extends Node3D

@export var rect: ColorRect

var mul = Global.speed_score_multiplier

func _ready() -> void:
	rect.material.set_shader_parameter("blur_power", 0.0)

func _physics_process(delta: float) -> void:
	if mul >= 1.5:
		rect.material.set_shader_parameter("blur_power", 0.01)
	elif mul >= 2:
		rect.material.set_shader_parameter("blur_power", 0.5)
	elif mul >= 3:
		rect.material.set_shader_parameter("blur_power", 1.0)
