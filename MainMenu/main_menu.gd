extends Control

@export var next_scene = Global.next_scene
var is_animating = false

func _process(delta):
	pass

func _ready():
	$FadetoBlack.visible = false

func _on_start_game_pressed():
	is_animating = true
	butter_transition()

func _on_quit_game_pressed():
	get_tree().quit()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _on_fadeto_black_transition_complete():
	print("fade_complete")
	get_tree().change_scene_to_file(next_scene)
	
func butter_transition():
	if is_animating:
		$Transition/AnimationPlayer.play("Move down")
		


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file(next_scene)
