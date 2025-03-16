extends Node3D

@export var rect: ColorRect


func _ready() -> void:
	rect.material.set_shader_parameter("blur_power", 0.0)

func _physics_process(delta: float) -> void:
	if Global.speed_score_multiplier >= 3.0:
		rect.material.set_shader_parameter("blur_power", 1.0)
	
	rect.material.set_shader_parameter("blur_power", 0.005 * (Global.speed_score_multiplier-1.0))
