extends State

@export 
var sprite2 : Sprite2D
@export 
var killable : Killable
@onready 
var player : CharacterBody2D = get_parent().get_parent().get_parent().get_node("Player")
 
var  right : Vector2 = Vector2.RIGHT
var  left : Vector2 = Vector2.LEFT
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter():
	playback.travel(animation_name)
	killable.connect("on_hit", on_killable_hit)

func process_physics(delta): 
		# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += gravity * delta
		
	var relative_distance = player.position.x - character.position.x
	if relative_distance > 150:
		sprite2.position.x = 13
		sprite.flip_h = false
		character.velocity.x = right.x * character.speed
	elif relative_distance < -150:
		sprite2.position.x = -13
		sprite.flip_h = true
		character.velocity.x = left.x * character.speed
	else:
		SignalBus.emit_signal("die",true)
	character.move_and_slide()

func on_killable_hit():
	state_transition.emit(self,"Die")
