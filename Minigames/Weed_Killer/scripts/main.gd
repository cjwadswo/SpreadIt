extends Node2D

func game_won():
	pass

func _ready():
	Global.game_over = false
	$Pause.visible = true
	get_tree().paused = true

func _process(delta):
	pass

func _on_button_pressed():
	get_tree().paused = false
	$Pause.visible = false

func _on_flower_emitscore():
	Global.score += 1
