extends Control

@export var next_scene = "res://main_menu.tscn"

func _ready():
	$FadetoBlack.visible = false

func _on_start_game_pressed():
	$FadetoBlack.visible = true
	$FadetoBlack.fade_to_black()

func _on_quit_game_pressed():
	get_tree().quit()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _on_fadeto_black_transition_complete():
	print("fade_complete")
	get_tree().change_scene_to_file(next_scene)
