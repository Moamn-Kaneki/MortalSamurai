extends ParallaxLayer

@export
var speed : float = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.motion_offset.x += speed
