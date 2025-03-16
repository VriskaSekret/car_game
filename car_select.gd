extends Control
@onready var choose_suv: Button = $HSplitContainer/VBoxContainer/MarginContainer2/chooseSUV
@onready var choose_dababy: Button = $HSplitContainer/VBoxContainer/MarginContainer/chooseDababy

func _ready() -> void:
	choose_suv.grab_focus()

func _on_choose_suv_pressed() -> void:
	Global.car = 0
	ButtonSFX.play()
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")

func _on_choose_suv_mouse_entered() -> void:
	choose_suv.grab_focus()

func _on_choose_suv_focus_entered() -> void:
	ButtonSelectSFX.play()

func _on_choose_dababy_pressed() -> void:
	Global.car = 1
	ButtonSFX.play()
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")

func _on_choose_dababy_mouse_entered() -> void:
	choose_dababy.grab_focus()


func _on_choose_dababy_focus_entered() -> void:
	ButtonSelectSFX.play()
