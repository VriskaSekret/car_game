extends Area3D



func _on_body_entered(body: Node3D) -> void:
	Global.score += 1
	queue_free()

func _physics_process(delta: float) -> void:
	rotate_y(delta*1)
