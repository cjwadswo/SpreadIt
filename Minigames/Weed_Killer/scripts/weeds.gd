extends Node2D

@export var health = 10
@export var scale_speed = 0.25
var target_scale = Vector2(1.0, 1.0)

func _ready():
	scale.x = 0
	scale.y = 0

func _process(delta):
	scale = scale.lerp(target_scale, scale_speed * delta)

func take_damage():
	$Sound.play()
	health -= 1
	scale.x -= 0.1
	scale.y -= 0.1
	$CPUParticles2D.emitting = true
	if health <= 0:
		queue_free()
		Global.score += 1

func _on_body_entered(body):
	if body.is_in_group("Weapon"):
		take_damage()

