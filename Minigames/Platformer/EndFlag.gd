extends Area2D

@onready var win_text = get_parent().get_node("WinText")
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if body.is_in_group("Player"):
		win_text.visible = true
		Global.has_won = true
		Global.game_over = true
		
