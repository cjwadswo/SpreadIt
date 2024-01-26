extends Area2D

@export var move_speed : float = 32.0 * Global.speed
@export var move_dir : Vector2
@export var health = Global.speed

var alive = true
var start_pos : Vector2
var target_pos : Vector2

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir
	$Label.text = str(health)

func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * Global.speed * delta)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else: 
			target_pos = start_pos

func _on_area_entered(area):
	if area.is_in_group("arrow") and alive == true:
		area.queue_free()
		health -= 1
		$Label.text = str(health)
		print("arrow hit")
		if health < 1:
			$Sprite2D.visible = false
			$CollisionShape2D.visible = false
			$Label.visible = false
			$AnimatedSprite2D.visible = true
			Global.spread_the_love_score += 1
			alive = false
			set_process(false)

