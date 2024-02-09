extends Label

var score_track : int = 0

func _ready():
	SignalBus.connect("on_enemy_killed",enemy_killed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text ="Score\n" + str(score_track)

func enemy_killed(score : int):
	score_track += score
	SignalBus.emit_signal("total_score",score_track)

