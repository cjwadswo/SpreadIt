extends Area2D

@onready var win_text = get_parent().get_node("WinText")
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_node("../RisingWater").stop_water = true
		win_text.visible = true
		get_node("../Transition/AnimationPlayer").play("Move Down")
		


func _on_animation_player_animation_finished(anim_name):
	Global.has_won = false
	Global.game_over = true
