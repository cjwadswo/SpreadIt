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
	Global.has_won = true
	print("game lost")

func _on_timer_out_of_time():
	game_lost()

func _process(delta):
	if Global.speed <= 2.0 and Global.weed_killer_score == 3:
			game_won()
	if Global.speed == 3.0 and Global.weed_killer_score == 6:
			game_won()
	if Global.speed > 3.0 and Global.weed_killer_score > 8:
			game_won()

func _on_flower_emitscore():
	Global.weed_killer_score += 1
