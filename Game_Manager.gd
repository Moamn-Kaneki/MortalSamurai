extends Node

class_name GameManager

var died : bool = false
@onready
var death : Death = $Death

signal toggle_game_paused(is_paused : bool)

func _ready():
	get_tree().paused = false
	SignalBus.connect("die", die_scene)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

func _input(event : InputEvent):
	if event.is_action_pressed("ui_cancel") and !died:
		game_paused = !game_paused

func die_scene(die : bool):
	died = die
	death.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = die
