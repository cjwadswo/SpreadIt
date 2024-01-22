extends Area2D

@export var move_speed : float = 32.0
@export var move_dir : Vector2

var start_pos : Vector2
var target_pos : Vector2

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir

func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else: 
			target_pos = start_pos

func _on_area_entered(area):
	if area.is_in_group("arrow"):
		area.queue_free()
		queue_free()
		print("arrow hit")
