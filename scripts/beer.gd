extends Area3D



func _on_body_entered(body: Node3D) -> void:
	Global.speed_score_multiplier += 0.05
	queue_free()

func _physics_process(delta: float) -> void:
	rotate_y(delta*1)
