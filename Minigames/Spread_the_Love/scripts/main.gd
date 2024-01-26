extends Node2D

func _ready():
	Global.game_over = false
	Global.has_won = false

func game_won():
	Global.score += 1
	Global.game_over = true
	Global.has_won = true
	print("game won")

func game_lost():
	Global.game_over = true
	Global.has_won = false
	print("game lost")

func _process(delta):
	if Global.spread_the_love_score > 2:
		game_won()

func _on_flower_emitscore():
	Global.spread_the_love_score += 1

func _on_timer_out_of_time():
	game_lost()
