extends Control


func _on_choose_suv_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")
