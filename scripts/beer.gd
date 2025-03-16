extends Area3D

@onready var player = get_tree().get_first_node_in_group("Player")


func _on_body_entered(body: Node3D) -> void:
	Global.speed_score_multiplier += 0.05
	BeerSFX.play()
	queue_free()

func _physics_process(delta: float) -> void:
	if (position.distance_to(player.position) > 100):
		queue_free()
	rotate_y(delta*1)
