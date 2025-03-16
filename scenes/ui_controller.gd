extends Control
@onready var game_over: Control = $game_over
@onready var in_game_ui: Control = $in_game_UI
@onready var score: Label = $game_over/VBoxContainer/score

func _process(delta: float) -> void:
	if Global.is_dead:
		score.text = "FINAL SCORE: %d" % Global.score
		game_over.visible = true
		in_game_ui.visible = false
	else:
		game_over.visible = false
		in_game_ui.visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
