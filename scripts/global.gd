extends Node

@onready var speed_score_multiplier = 1.0
@onready var is_dead = false
@onready var score = 0
@onready var time_left: float = 30.0
@onready var car = 0

func reset_global_vars():
	speed_score_multiplier = 1.0
	is_dead = false
	score = 0
	time_left = 30.0
	car = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		reset_global_vars()
		get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
