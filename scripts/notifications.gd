extends Control

@onready var add_score: Label = $addScore
@onready var add_multi: Label = $addMulti
@onready var last_score: float = 0
@onready var last_multi: float = 1
@onready var notif_timer: Timer = $notifTimer
@onready var notifications: Control = $"."

func _process(delta):
	if last_score != Global.score:
		add_multi.text = ""
		add_score.rotation_degrees = randi_range(-45, 45)
		add_score.text = " +%s Score " % (snapped(Global.score - last_score, 1))
		last_score = Global.score
		notif_timer.start()
	if last_multi != Global.speed_score_multiplier:
		add_score.text = ""
		add_multi.rotation_degrees = randi_range(-45, 45)
		add_multi.text = " +%s Multi " % (Global.speed_score_multiplier - last_multi)
		last_multi = Global.speed_score_multiplier
		notif_timer.start()


func _on_notif_timer_timeout() -> void:
	add_score.text = ""
	add_multi.text = ""
