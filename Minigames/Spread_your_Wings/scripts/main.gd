extends Node

var pipe_scene_top = preload("res://Minigames/Spread_your_Wings/scenes/pillar_top.tscn")
var pipe_scene_bottom = preload("res://Minigames/Spread_your_Wings/scenes/pillar_bottom.tscn")
var pipe_timer = 0
var pipe_spawn_interval = 0.5 * Global.speed


func _ready():
	Global.game_over = false
	Global.has_won = false
	get_node("Transitions/AnimationPlayer").play("Fade_in")

func game_won():
	Global.score += 1
	
	print("game won")

func game_lost():
	get_node("Transition/AnimationPlayer").play("move_down")
	print("game lost")

func _on_flower_emitscore():
	Global.spread_the_love_score += 1

func _on_timer_out_of_time():
	get_node("Transition/AnimationPlayer").play("move_down")
	Global.has_won = true
	game_won()

func _on_player_game_lost():
	Global.has_won = false
	
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


func _on_animation_player_animation_finished(anim_name):
	Global.game_over = true
