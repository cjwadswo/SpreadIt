extends ColorRect

signal transition_complete

func fade_to_black():
	$AnimationPlayer.play("fade_to_black")

func _on_animation_player_animation_finished(fade_to_black):
	transition_complete.emit()
