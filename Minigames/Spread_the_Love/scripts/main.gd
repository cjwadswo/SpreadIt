extends Node2D
#Need to always change the 'Process - Mode' to 'When Paused' for this to work.

func game_won():
	pass

func _ready():
	$Pause.visible = true
	get_tree().paused = true

func _process(delta):
	pass

func _on_button_pressed():
	print("button pressed")
	get_tree().paused = false
	$Pause.visible = false

func _on_heart_emitscore():
	Global.score += 1
	print("emit done")
