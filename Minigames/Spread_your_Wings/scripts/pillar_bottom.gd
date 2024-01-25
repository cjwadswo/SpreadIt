extends CharacterBody2D

var pipe_speed = Vector2(-400, 0)

func _process(delta):
	# Move the pipe to the left
	translate(pipe_speed * delta * Global.speed)
	if position.x < -300:
		position.x = randf_range(400, 600)
		position.y = randf_range(525, 700)
