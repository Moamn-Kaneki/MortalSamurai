extends State

func enter():
	playback.travel(animation_name)


func _on_animation_tree_animation_finished(_anim_name):
	character.queue_free()
