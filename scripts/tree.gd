extends RigidBody3D

@onready var player = get_tree().get_first_node_in_group("Player")
#this script does nothing

func _physics_process(delta: float) -> void:
	if (position.distance_to(player.position) > 20):
		queue_free()
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		freeze = false
		if collision.get_collider().has_method("checker_blaa"):
			if Global.speed_score_multiplier > 1.0:
				Global.speed_score_multiplier -= 0.05
			if Global.speed_score_multiplier <= 1.0:
				Global.speed_score_multiplier = 1.0
