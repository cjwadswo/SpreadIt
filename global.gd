extends Node

#Level Paths
var minigame_spread_out = "res://Minigames/Spread_Out/Spread_Out_Minigame.tscn"
var minigame_platformer = "res://Minigames/Platformer/platformer.tscn"
var minigame_spread_the_love = "res://Minigames/Spread_the_Love/scenes/main.tscn"
var minigame_spread_the_wings = "res://Minigames/Spread_your_Wings/scenes/main.tscn"
var minigame_weed_killer = "res://Minigames/Weed_Killer/scenes/main.tscn"
var minigames = []
var random_minigames
var next_scene

var weed_killer_score = 0
var spread_the_love_score = 0
var spread_your_wings_score = 0
var spread_out_timer = 8
var score = 0
var game_over = false
var has_won = false
var game_start = false
var is_game_paused = false
var speed = 1.0
var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	#Add minigames to the array.
	add_minigames_to_array()
	random_minigames = minigames.duplicate()
	#Shuffle minigames
	random_minigames.shuffle()
	print(random_minigames)
	next_scene = random_minigames.pop_back()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.speed == 1:
		Global.spread_out_timer = 8
	elif Global.speed == 2:
		Global.spread_out_timer = 5
	elif Global.speed == 3:
		Global.spread_out_timer = 3
	else:
		Global.spread_out_timer = 2
	load_next_scene()
	
func load_next_scene():
	if random_minigames.size() > 0:
		if game_over == true:
			next_scene = random_minigames.pop_back()
			get_tree().paused = true
			if has_won == false:
				lives = lives - 1
				if lives > 0:
					get_tree().paused = false
					get_tree().change_scene_to_file(next_scene)
			else:
				get_tree().change_scene_to_file(next_scene)
				get_tree().paused = false
	elif lives > 0: #Randomize array again and go again with higher difficulty!
		speed = speed + 1.0
		random_minigames = minigames.duplicate()
		random_minigames.shuffle()
		print(random_minigames)

func add_minigames_to_array():
	minigames.append(minigame_spread_out)
	minigames.append(minigame_platformer)
	minigames.append(minigame_spread_the_love)
	minigames.append(minigame_spread_the_wings)
	minigames.append(minigame_weed_killer)
