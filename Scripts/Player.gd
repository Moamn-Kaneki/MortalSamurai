extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export
var state_machine : StateMachine
@export 
var sword_colli : CollisionShape2D
@export 
var sprite : Sprite2D 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func _input(event:InputEvent):
	if event.is_action_pressed("ui_right"):
		right_face()
	elif event.is_action_pressed("ui_left"):
		left_face()
	if event.is_action_pressed("ui_left") || event.is_action_pressed("ui_right"):
		SignalBus.emit_signal("state_name",state_machine.current_state.name)

func right_face():
	sprite.flip_h = false
	sword_colli.position.x = 51

func left_face():
	sprite.flip_h = true
	sword_colli.position.x = -51

