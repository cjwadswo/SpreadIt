extends Label

var bob_height : float = 5.0
var bob_speed : float = 5.0
var t : float

@onready var start_y : float = global_position.y


func _process(delta):
	t += delta
	var d = (sin(t * bob_speed)) / 2
	global_position.y = start_y + (d * bob_height)
	if Global.retry == true:
		self.visible = true
