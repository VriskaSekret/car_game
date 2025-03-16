extends Control
@onready var game_over: Control = $game_over
@onready var in_game_ui: Control = $in_game_UI

func _process(delta: float) -> void:
	if Global.is_dead:
		game_over.visible = true
		in_game_ui.visible = false
	else:
		game_over.visible = false
		in_game_ui.visible = true
