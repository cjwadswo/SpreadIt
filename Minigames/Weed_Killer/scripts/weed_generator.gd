extends Node

@export var weed_scene = preload("res://scenes/weeds.tscn")
@export var weed_count = 250

func _ready():
	generate_weeds()

func generate_weeds():
	for i in range(weed_count):
		var weed_instance = weed_scene.instantiate()
		weed_instance._on_body_entered
		weed_instance.position = Vector2(randf_range(0, get_viewport().size.x), 
		randf_range(0, get_viewport().size.y - 200))
		weed_instance.rotation_degrees = randf_range(-45, 45)
		weed_instance.scale = Vector2(randf_range(0.5, 1.5), randf_range(0.5, 1.5))
		add_child(weed_instance)
