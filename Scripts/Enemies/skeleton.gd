extends CharacterBody2D

@onready 
var animationTree : AnimationTree = $AnimationTree
@export 
var score : int
@export
var speed : float

func _ready():
	animationTree.active = true
