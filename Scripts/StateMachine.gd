extends Node
class_name StateMachine

var states : Dictionary = {}
var current_state : State
@export var initial_state : State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.process_frame(delta)

func _physics_process(delta):
	if current_state:
		current_state.process_physics(delta)

func change_state(source_state: State, new_state_name: String):
	if source_state != current_state:
		print("Invalid change_state trying from: "+ source_state.name +" but currently in: "+ current_state.name)
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
	if current_state:
		current_state.exit()
	
	new_state.enter()
	
	current_state = new_state 

func _input(event):
	if current_state:
		current_state.process_input(event)
