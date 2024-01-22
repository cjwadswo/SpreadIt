extends CharacterBody2D

var jump_force = Vector2(0, -400)
var gravity = 1000
var floor = 640

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	self.look_at(mouse_pos)
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, gravity)
	move_and_slide()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		jump()
	if position.y > floor:
		game_over()
	if position.x < 0:
		game_over()

func jump():
	velocity.y = jump_force.y

func game_over():
	print("Game Over")
	position.y = floor
	velocity = Vector2.ZERO
