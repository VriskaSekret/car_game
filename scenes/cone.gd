extends RigidBody3D

@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	if (position.distance_to(player.position) > 100):
		queue_free()
