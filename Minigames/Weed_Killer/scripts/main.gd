extends Node2D

func _ready():
	Global.game_over = false
	Global.has_won = false

func _process(delta):
	if Global.speed <= 2.0 and Global.weed_killer_score == 3:
			game_won()
	if Global.speed == 3.0 and Global.weed_killer_score == 6:
			game_won()
	if Global.speed > 3.0 and Global.weed_killer_score > 8:
			game_won()

func _on_flower_emitscore():
	Global.weed_killer_score += 1
