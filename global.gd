extends Node

@export var next_scene = "res://Minigames/Spread_the_Love/scenes/main.tscn"

var score = 0
var game_over = false
var game_start = false
var is_game_paused = false
var speed = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_over == true:
		get_tree().change_scene_to_file(next_scene)
