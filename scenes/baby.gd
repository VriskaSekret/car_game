extends Area3D

func _on_body_entered(body: Node3D) -> void:
	Global.score += (Global.speed_score_multiplier * 100)
	queue_free()
