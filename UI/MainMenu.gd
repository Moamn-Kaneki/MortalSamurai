extends Control

@onready
var owl_sound : AudioStreamPlayer = $AudioStreamPlayer
@onready
var timer : Timer = $Timer

func _ready():
	owl_sound.playing = false
	get_tree().paused = false
	timer.start()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_timer_timeout():
	owl_sound.play()
