extends Node2D

func _ready():
	global_position.y = 575
	global_position.x = 180

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		global_position.y = get_global_mouse_position().y - 75
		global_position.x = get_global_mouse_position().x
	self.rotation = position.angle_to(get_global_mouse_position())
