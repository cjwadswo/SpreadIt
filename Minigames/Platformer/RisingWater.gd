extends Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2
var start_pos : Vector2
var target_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir
	if Global.speed == 1:
		move_speed = 20.0
	elif Global.speed == 2:
		move_speed = 30.0
	elif Global.speed == 3:
		move_speed = 40.0
	else:
		move_speed = 45.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.has_won = false
		Global.game_over = true
