extends Node

var pipe_scene_top = preload("res://Minigames/Spread_your_Wings/scenes/pillar_top.tscn")
var pipe_scene_bottom = preload("res://Minigames/Spread_your_Wings/scenes/pillar_bottom.tscn")
var pipe_timer = 0
var pipe_spawn_interval = 0.5 * Global.speed


func _ready():
	Global.game_over = false
	Global.has_won = false

func game_won():
	Global.score += 1
	Global.game_over = true
	Global.has_won = true
	print("won spread your wings")

func game_lost():
	Global.game_over = true
	Global.has_won = false
	print("lost spread your wings")

func _on_flower_emitscore():
	Global.spread_the_love_score += 1

func _on_timer_out_of_time():
	game_won()

func _on_player_game_lost():
	game_lost()

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
