extends Area2D

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Killable:
			child.hit(body.name)
