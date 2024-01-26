extends Node2D

func _ready():
	Global.game_over = false
	Global.has_won = false
	get_node("Transitions/AnimationPlayer").play("Fade_in")

func game_won():
	get_node("Transition/AnimationPlayer").play("move_down")
	

func game_lost():
	Global.game_over = true
	Global.has_won = false
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


func _on_animation_player_animation_finished(anim_name):
	Global.score += 1
	Global.game_over = true
	Global.has_won = true
	
