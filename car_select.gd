extends Control

@onready var choose_suv: Button = $HSplitContainer/VBoxContainer2/chooseSUV

func _ready() -> void:
	choose_suv.grab_focus()

func _on_choose_suv_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")
	ButtonSFX.play()

func _on_choose_suv_mouse_entered() -> void:
	choose_suv.grab_focus()

func _on_choose_suv_focus_entered() -> void:
	ButtonSelectSFX.play()


func _on_choose_dababy_pressed() -> void:
	pass # Replace with function body.