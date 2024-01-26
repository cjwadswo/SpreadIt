extends CharacterBody2D

var move_speed : float = 100.0
var initial_jump_force : float = 150
var jump_force : float = 10
var gravity : float = 500.0
var score : int = 0
var jump_state: bool = false
@onready var lose_text = get_parent().get_node("LoseText")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = 0
	move()
	
	if global_position.y > 100:
		game_over()

func game_over():
	
	lose_text.visible = true
	Global.game_over = true

	
func move():
	if Input.get_action_strength("Move_Left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("Move_Right"):
		velocity.x += move_speed
	if Input.is_action_pressed("Jump"):
		jump()
	move_and_slide()

func jump():
	if is_on_floor():
		velocity.y = -initial_jump_force
		
