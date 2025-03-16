extends Camera3D

@export var lerp_speed = 3.0
@export var offset = Vector3.ZERO
@export var target : Node

@onready var dababy_car_mesh: Node3D = $"../DababyCar/CarMesh"
@onready var car_mesh: Node3D = $"../Car/CarMesh"

func _ready() -> void:
	if !target:
		target = find_player_car_mesh()
	target.get_parent().visible = true

func find_player_car_mesh():
	if Global.car == 0:
		dababy_car_mesh.get_parent().queue_free()
		return car_mesh
	elif Global.car == 1:
		car_mesh.get_parent().queue_free()
		return dababy_car_mesh

func _physics_process(delta):
	if !target:
		return
	var target_pos = target.global_transform.translated_local(offset)
	global_transform = global_transform.interpolate_with(target_pos, lerp_speed * delta)
	look_at(target.global_position, Vector3.UP)
