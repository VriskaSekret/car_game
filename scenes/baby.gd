extends Area3D

@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	if (position.distance_to(player.position) > 100):
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	Global.score += (Global.speed_score_multiplier * 100)
	queue_free()
