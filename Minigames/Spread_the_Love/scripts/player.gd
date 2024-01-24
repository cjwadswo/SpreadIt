extends CharacterBody2D
@onready var arrow = preload("res://scenes/arrow.tscn")

var start_pos : Vector2
var target_pos : Vector2
var bow_cooldown = true
var bow_speed : float

@export var move_speed : float = 32.0 * Global.speed
@export var move_dir : Vector2

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	$bow_sprite.look_at(mouse_pos)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and bow_cooldown:
		bow_cooldown = false
		var arrow_instance = arrow.instantiate()
		arrow_instance.rotation = $Marker2D.rotation
		arrow_instance.global_position = $Marker2D.global_position
		add_child(arrow_instance)
		await get_tree().create_timer(bow_speed).timeout
		bow_cooldown = true

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir
	if Global.speed == 1.0:
		print(Global.speed)
		bow_speed = 1.25
		print(bow_speed)
	elif Global.speed == 2.0:
		print(Global.speed)
		bow_speed = 1.0
		print(bow_speed)
	elif Global.speed == 3.0:
		bow_speed = 0.75
		print(bow_speed)
	elif Global.speed == 4.0:
		bow_speed = 0.5
		print(bow_speed)

func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else: 
			target_pos = start_pos
	
