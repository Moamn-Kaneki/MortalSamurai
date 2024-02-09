extends Node2D

class_name  Death

@export
var vbox : VBoxContainer
@onready
var canvas_layer1 : CanvasLayer = $CanvasLayer
@onready
var canvas_layer2 : CanvasLayer = $CanvasLayer2


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	canvas_layer1.hide()
	canvas_layer2.hide()
	vbox.hide()
	SignalBus.connect("die", _on_die)

func  _on_die(die : bool):
	if die :
		show()
		canvas_layer1.show()
		canvas_layer2.show()


func _on_animation_player_animation_finished(_anim_name):
	vbox.show()


func _on_restart_died_pressed():
	get_tree().reload_current_scene()


func _on_quit_died_pressed():
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
