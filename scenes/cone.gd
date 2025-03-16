extends RigidBody3D

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	rotate_y(randi_range(0,360))

func _physics_process(delta: float) -> void:
	if (position.distance_to(player.position) > 100):
		queue_free()
