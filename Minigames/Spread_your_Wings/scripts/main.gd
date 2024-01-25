extends Node

var pipe_scene_top = preload("res://scenes/pillar_top.tscn")
var pipe_scene_bottom = preload("res://scenes/pillar_bottom.tscn")
var pipe_timer = 0
var pipe_spawn_interval = 0.5 * Global.speed

func _process(delta):
	pipe_timer += delta
	if pipe_timer > pipe_spawn_interval:
		spawn_pipe_bottom()
		spawn_pipe_top()
		pipe_timer = 0

func spawn_pipe_top():
	var pipe_instance_top = pipe_scene_top.instantiate()
	add_child(pipe_instance_top)
	pipe_instance_top.position = Vector2(randf_range(400,500), -110)

func spawn_pipe_bottom():
	var pipe_instance_bottom = pipe_scene_bottom.instantiate()
	add_child(pipe_instance_bottom)
	pipe_instance_bottom.position = Vector2(randf_range(400,500), 700)

func game_won():
	pass

func _ready():
	Global.game_over = false
	$Pause.visible = true
	get_tree().paused = true

func _on_button_pressed():
	get_tree().paused = false
	$Pause.visible = false
