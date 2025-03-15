extends Node3D

@export var powerup_scenes: Array = []  # Array to hold different power-up scenes
@export var player: Node3D  # Assign the player node here in the inspector
@export var min_distance: float = 10.0  # Min spawn distance from player
@export var max_distance: float = 50.0  # Max spawn distance from player
@export var spawn_interval: float = 1.0  # Distance the player must travel before spawning
@export var track_width: float = 30.0  # Adjust based on track width

var last_spawn_position: Vector3  # Track last spawn position

func _ready():
	last_spawn_position = player.global_transform.origin

func _process(delta):
	var distance_traveled = player.global_transform.origin.distance_to(last_spawn_position)

	if distance_traveled >= spawn_interval:
		last_spawn_position = player.global_transform.origin
		spawn_powerup()

func spawn_powerup():
	var track_curve = self.curve  # Get track's curve
	var track_length = track_curve.get_baked_length()

	# Find closest point on track to the player
	var player_pos = player.global_transform.origin
	var closest_offset = track_curve.get_closest_offset(player_pos)
	
	# Generate a random distance ahead of the player
	var spawn_offset = fmod(closest_offset + randf_range(min_distance, max_distance), track_length)
	var spawn_position = track_curve.sample_baked(spawn_offset)

	# Adjust left-right variation within track width
	var track_rotation = track_curve.sample_baked_with_rotation(spawn_offset)
	var right_vector = track_rotation.basis.x  # Side direction of track
	var lateral_shift = randf_range(-track_width / 2, track_width / 2) + 12.0  # Shift right
	var vertical_offset = 1.5  # Raise power-ups above track

	# Select a random power-up from the exported array
	if powerup_scenes.size() > 0:
		var random_selection = randi_range(1, 100)
		var random_powerup_scene
		if 0 < random_selection and random_selection <= 30:
			random_powerup_scene = powerup_scenes[0]
		elif 30 < random_selection and random_selection <= 50:
			random_powerup_scene = powerup_scenes[1]
		elif 50 < random_selection and random_selection <= 80:
			random_powerup_scene = powerup_scenes[2]
		elif 80 < random_selection and random_selection <= 100:
			random_powerup_scene = powerup_scenes[3]
		var powerup = random_powerup_scene.instantiate()
		if powerup.name == "tree":
			vertical_offset = 0.0
		if powerup.name == "baby":
			vertical_offset = 0.0
		if powerup.name == "cone":
			vertical_offset = 0.0

		# Add power-up to the scene
		get_parent().add_child(powerup)

		# Position the power-up on the track
		powerup.global_transform.origin = spawn_position + (right_vector * lateral_shift) + Vector3(0, vertical_offset, 0)
