extends Label

var bob_height : float = 5.0
var bob_speed : float = 5.0
var t : float

@onready var start_y : float = global_position.y

func _process(delta):
	t += delta
	var d = (sin(t * bob_speed)) / 2
	global_position.y = start_y + (d * bob_height)

func fade_out():
	for i in 10:
		await get_tree().create_timer(0.1).timeout
		scale -= Vector2(0.1,0.1)

func _on_timer_timeout():
	fade_out()
