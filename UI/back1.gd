extends ParallaxLayer

@export
var speed : float = -0.0001

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.motion_offset.x += speed
