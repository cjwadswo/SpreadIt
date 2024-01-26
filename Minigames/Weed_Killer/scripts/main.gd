extends Node2D

func game_won():
	pass

func _ready():
	Global.game_over = false
	

func _process(delta):
	if Global.speed <= 2:
		if Global.score == 3:
			Global.has_won = true
			Global.game_over = true
	if Global.speed == 3:
		if Global.score == 6:
			Global.has_won = true
			Global.game_over = true
	if Global.speed == 4:
		if Global.score == 9:
			Global.has_won = true
			Global.game_over = true
func _on_button_pressed():
	pass
	#get_tree().paused = false
	#$Pause.visible = false

func _on_flower_emitscore():
	Global.score += 1


func _on_flower_2_emitscore():
	Global.score += 1


func _on_flower_3_emitscore():
	Global.score += 1
