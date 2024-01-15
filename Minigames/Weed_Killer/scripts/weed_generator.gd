extends Node

@export var weed_scene = preload("res://scenes/weeds.tscn")
@export var weed_count = 50
var node_count

func _ready():
	generate_weeds()
	%Timer.start()

func generate_weeds():
	for i in range(weed_count):
		var weed_instance = weed_scene.instantiate()
		weed_instance._on_body_entered
		weed_instance.position = Vector2(randf_range(0, get_viewport().size.x), 
		randf_range(0, get_viewport().size.y - 200))
		weed_instance.rotation_degrees = randf_range(-45, 45)
		weed_instance.scale = Vector2(randf_range(0.5, 1.5), randf_range(0.5, 1.5))
		add_child(weed_instance)

func _on_timer_timeout():
	var node_count = get_tree().get_nodes_in_group("Weeds").size()
	print(node_count)
	if node_count < 250:
		generate_weeds()

func _process(delta):
	if Global.score > 2:
		%Timer.stop()

