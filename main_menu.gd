extends Control

@onready var start_button: Button = $VBoxContainer/startButton
@onready var exit_button: Button = $VBoxContainer/exitButton

func _ready() -> void:
	BGM.play()
	start_button.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/carSelect.tscn")
	ButtonSFX.play()
	Global.score = 0
	Global.speed_score_multiplier = 1
	Global.is_dead = false


func _on_start_button_mouse_entered() -> void:
	start_button.grab_focus()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_focus_entered() -> void:
	ButtonSelectSFX.play()


func _on_exit_button_mouse_entered() -> void:
	exit_button.grab_focus()


func _on_exit_button_focus_entered() -> void:
	ButtonSelectSFX.play()
