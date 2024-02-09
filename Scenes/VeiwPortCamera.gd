extends Camera2D

var shake_amount: float = 0
var default_offset: Vector2 = offset
var pos_x : int
var pos_y : int

@onready
var fade_timer : Timer = $FadeTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	randomize()
	SignalBus.connect("state_name",shake)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	offset = Vector2(randf_range(-1,1)*shake_amount,randf_range(-1,1)*shake_amount)

func shake(state_name : String):
	if state_name != "Idle":
		if state_name == "Miss":
			shake_amount = 5
		else:
			shake_amount = 2
		set_process(true)
		fade_timer.start()

func _on_fade_timer_timeout():
	set_process(false)
	Tween.interpolate_value(self, "offset",31,-87,Tween.TRANS_LINEAR,Tween.EASE_IN)
