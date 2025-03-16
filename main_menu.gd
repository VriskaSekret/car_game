extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/carSelect.tscn")
	Global.score = 0
	Global.speed_score_multiplier = 1
	Global.is_dead = false
