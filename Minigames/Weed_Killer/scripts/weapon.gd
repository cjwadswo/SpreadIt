extends Node2D

func _ready():
	global_position.y = 575
	global_position.x = 180

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		global_position.y = get_global_mouse_position().y
		global_position.x = get_global_mouse_position().x
		#global_position.x = lerp(position.x, get_global_mouse_position().x, 0.5)
	self.rotation = lerp(position.angle_to(get_global_mouse_position()),get_global_mouse_position().x/20, 0.1)
