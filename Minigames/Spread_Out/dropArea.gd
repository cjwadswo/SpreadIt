extends Area2D

func _on_area_entered(area):
	toggle_sprite(area)
	area.is_in_area = true

func toggle_sprite(area):
	var sprite = area.get_node("AngrySprite")
	sprite.hide()
