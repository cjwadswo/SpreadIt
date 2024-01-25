extends Area2D
#Variables to move the coin
var bob_height : float = 5.0
var bob_speed : float = 5.0
@export var points: int = 1

@onready var start_y : float = global_position.y
var t : float = 0.0

func _process(delta):
	t += delta
	var d = (sin(t * bob_speed) + 1) / 2
	global_position.y = start_y + (d)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(points)
		queue_free()
