extends RigidBody3D

var sphere_offset = Vector3.DOWN
var acceleration = 25.0
var steering = 29.0
var turn_speed = 2.0
var turn_stop_limit = 3.0
var body_tilt = 35
var drift_direction_multiplier = 1

var speed_input = 0
var turn_input = 0

@onready var car_mesh = $CarMesh
@onready var body_mesh = $CarMesh/dababycar
@onready var ground_ray = $CarMesh/RayCast3D

@onready var engine_player: AudioStreamPlayer = $Engine
@onready var drift_player: AudioStreamPlayer = $Drift
@onready var cpu_particles_3d: CPUParticles3D = $CarMesh/CPUParticles3D




#func _ready():
#	ground_ray.add_exception(self)
	
func _physics_process(delta):
	car_mesh.position = position + sphere_offset
	if position.y < -10:
		#
		# IMPLEMENT GAME OVER
		#
		Global.is_dead = true
	if ground_ray.is_colliding():
		apply_central_force(-car_mesh.global_transform.basis.z * speed_input)
	
func _process(delta):
	acceleration = 25.0 * (Global.speed_score_multiplier)
	if not ground_ray.is_colliding() or Global.is_dead:
		return
	engine_player.pitch_scale = ((abs(Input.get_axis("brake", "accelerate"))/2) + 1)
	if Input.is_action_pressed("handbrake"):
		turn_speed = 6.0
		drift_direction_multiplier = -1
	else:
		turn_speed = 3.0
		drift_direction_multiplier = 1
	if drift_direction_multiplier == -1 and Input.get_axis("steer_right", "steer_left") != 0:
		drift_player.play()
		cpu_particles_3d.emitting = true
		acceleration += acceleration * 0.2
	else:
		drift_player.stop()
		cpu_particles_3d.emitting = false
	speed_input = Input.get_axis("brake", "accelerate") * acceleration
	if speed_input > 0:
		turn_input = Input.get_axis("steer_right", "steer_left") * deg_to_rad(steering)
		engine_player.volume_db = 5 * ((abs(Input.get_axis("brake", "accelerate"))/2) + 1)
	elif speed_input < 0:
		turn_input = Input.get_axis("steer_right", "steer_left") * -deg_to_rad(steering)
		engine_player.volume_db = 5 * ((abs(Input.get_axis("brake", "accelerate"))/2) + 1)

	
	if linear_velocity.length() > turn_stop_limit:
		var new_basis = car_mesh.global_transform.basis.rotated(car_mesh.global_transform.basis.y, turn_input)
		car_mesh.global_transform.basis = car_mesh.global_transform.basis.slerp(new_basis, turn_speed * delta)
		car_mesh.global_transform = car_mesh.global_transform.orthonormalized()
		#var t = -turn_input * linear_velocity.length() / body_tilt
		#body_mesh.rotation.z = lerp(body_mesh.rotation.z, t, 5.0 * delta)
		if ground_ray.is_colliding():
			var n = ground_ray.get_collision_normal()
			var xform = align_with_y(car_mesh.global_transform, n)
			car_mesh.global_transform = car_mesh.global_transform.interpolate_with(xform, 10.0 * delta)

func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
#	xform.basis = xform.basis.orthonormalized()
	return xform.orthonormalized()

func checker_blaa():
	return
