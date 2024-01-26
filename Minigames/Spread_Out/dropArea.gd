extends Area2D

func _ready():
	print(self.global_position)
func _on_area_entered(area):
	print(self.get_groups())
	if self.get_groups()[0] == area.get_groups()[0] :
		area.is_in_area = true
		toggle_sprite(area)
		snap_position(area)
	

func toggle_sprite(area):
	var sprite = area.get_node("AngrySprite")
	sprite.hide()

func snap_position(area):
	pass
#	print("Self Position", self.position, "Area Position", area.position)
#	area.position.x = self.global_position.x
	
