extends Node2D

var Skeleton = preload("res://Scripts/Enemies/skeleton.tscn")

@onready
var player = $Player
@onready 
var timer = $SpawnTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("die", _on_die)
	SignalBus.connect("total_score",timer_decrease)


func _on_spawn_timer_timeout():
	var skeleton = Skeleton.instantiate()
	add_child(skeleton)
	skeleton.scale = Vector2(2.5,2.5)
	var nodes = get_tree().get_nodes_in_group("spawner")
	var node = nodes[randi() % nodes.size()]
	var spawn_position = node.global_position
	skeleton.position = spawn_position
	var score = 2 - timer.wait_time
	skeleton.score = 10 + (score*100)
	skeleton.speed = 50 + (score*33)

func timer_decrease(score: int):
	var score_float : float = int(score/100) /10.0
	print(score_float)
	if timer.wait_time >= 0.8:
		timer.wait_time = 2 - score_float

func _on_die(_die : bool):
	player.hide()
