extends Node3D

@export var powerup_scene: PackedScene  # Assign your power-up scene in the inspector
@export var player: Node3D  # Assign the player node here in the inspector
@export var min_distance: float = 10.0  # Min spawn distance from player
@export var max_distance: float = 50.0  # Max spawn distance from player
@export var spawn_interval: float = 1.0  # Distance the player must travel before spawning
@export var track_width: float = 20.0  # Adjust based on track width

var last_spawn_position: Vector3  # Track last spawn position

func _ready():
	last_spawn_position = player.global_transform.origin

func _process(delta):
	var distance_traveled = player.global_transform.origin.distance_to(last_spawn_position)

	if distance_traveled >= spawn_interval:
		last_spawn_position = player.global_transform.origin
		spawn_powerup()

func spawn_powerup():
	var track_curve = self.curve  # Correctly get the track's curve
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
	var lateral_shift = randf_range(-track_width / 2, track_width / 2)
	
	# Spawn power-up
	var powerup = powerup_scene.instantiate()
	get_parent().add_child(powerup)  # First add it to the scene
	
	# Now set its position safely
	powerup.global_transform.origin = spawn_position + (right_vector * lateral_shift)
