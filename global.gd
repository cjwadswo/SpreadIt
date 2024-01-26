extends Node

#Level Paths
var minigame_spread_out = "res://Minigames/Spread_Out/Spread_Out_Minigame.tscn"
var minigame_platformer = "res://Minigames/Platformer/platformer.tscn"
var minigame_spread_the_love = "res://Minigames/Spread_the_Love/scenes/main.tscn"
var minigame_spread_the_wings = "res://Minigames/Spread_your_Wings/scenes/main.tscn"
var minigame_weed_killer = "res://Minigames/Weed_Killer/scenes/main.tscn"
var minigames = []
@export var next_scene = minigame_weed_killer

var score = 0
var game_over = false
var game_start = false
var is_game_paused = false
var speed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	minigames.append(minigame_spread_out)
	minigames.append(minigame_platformer)
	minigames.append(minigame_spread_the_love)
	minigames.append(minigame_spread_the_wings)
	minigames.append(minigame_weed_killer)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_over == true:
		get_tree().change_scene_to_file(next_scene)
