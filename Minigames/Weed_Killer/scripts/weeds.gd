extends Node2D

@export var lives = 5

func _ready():
	pass

func _process(delta):
	pass

func take_damage():
	lives -= 1
	self.scale.x -= 0.15
	self.scale.y -= 0.15
	print("lives - 1")
	if lives <= 0:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Weapon"):
		print("hit")
		print(lives)
		self.take_damage()
		$Sound.play()
