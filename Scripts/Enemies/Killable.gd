extends Node

class_name Killable

signal on_hit

func hit(enemy_name : String):
	emit_signal("on_hit")
	SignalBus.emit_signal("on_enemy_killed",get_parent().score)
	print(enemy_name)

