class_name State
extends Node

signal state_transition 

@onready
var old_score: int = 0 
@export
var character: CharacterBody2D
@export 
var animation_tree: AnimationTree
@export 
var sprite : Sprite2D 
@export 
var animation_name: String
@onready
var playback : AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func enter() -> void :
	pass

func exit() -> void :
	pass

func process_input(_event: InputEvent):
	pass

func process_frame(_delta: float):
	pass

func process_physics(_delta: float):
	pass
