extends Camera3D

@export var lerp_speed = 3.0
@export var offset = Vector3.ZERO
@export var target : Node

func _ready() -> void:
	print(get_tree().get_nodes_in_group("Player"))
	if !target:
		target = get_tree().get_first_node_in_group("Player")


func _physics_process(delta):
	if !target:
		return
	var target_pos = target.global_transform.translated_local(offset)
	global_transform = global_transform.interpolate_with(target_pos, lerp_speed * delta)
	look_at(target.global_position, Vector3.UP)
