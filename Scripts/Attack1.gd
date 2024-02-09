extends State

@export
var right_miss : Area2D
@export
var left_miss : Area2D

func enter():
	playback.travel(animation_name)

func process_input(event: InputEvent):
	if event.is_action_pressed("ui_right"):
		character.position.x += 20
		if right_miss.has_overlapping_bodies():
			state_transition.emit(self,"Attack2")
		else:
			state_transition.emit(self,"Miss")
	elif event.is_action_pressed("ui_left"):
		character.position.x -= 20
		if left_miss.has_overlapping_bodies():
			state_transition.emit(self,"Attack2")
		else:
			state_transition.emit(self,"Miss")


func _on_animation_tree_animation_finished(_anim_name):
	state_transition.emit(self,"Idle")
