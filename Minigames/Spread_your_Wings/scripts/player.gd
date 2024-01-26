extends CharacterBody2D

var jump_force = Vector2(0, -400)
var gravity = 1000
var floor = 640
signal game_lost

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
	if position.x < -32:
		game_over()

func jump():
	velocity.y = jump_force.y
	$Sprite2D.visible = false
	$Sprite2D2.visible = true
	await get_tree().create_timer(0.3).timeout
	$Sprite2D.visible = true
	$Sprite2D2.visible = false

func game_over():
	game_lost.emit()
	position.y = floor
	position.x = 0
	velocity = Vector2.ZERO
