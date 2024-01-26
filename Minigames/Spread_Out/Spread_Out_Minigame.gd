extends Node2D
var draggable_nodes
var draggable_count : int
var has_won : bool = false
var has_won_text : Label

@export var transitioner : Transitioner
# Called when the node enters the scene tree for the first time.
func _ready():
	
	transitioner.fade_out()
	#generate draggable objects
	Global.game_over = false
	Global.has_won = false
	#generate drop_area zones
	
	$Timer.start()
	draggable_nodes = get_tree().get_nodes_in_group("dragable")
	draggable_count = draggable_nodes.size()
	has_won_text = get_node("WonText")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_win_condition()
		
func check_win_condition():
	var count : int = 0
	for node in draggable_nodes:
		if node.get_child(0).is_in_area == true:
			count += 1
	if count == draggable_count:
		has_won_text.visible = true
		get_node("Transition/AnimationPlayer").play("Move down")
		
		
func _on_timer_timeout():
	get_node("MinigameText").visible = false


func _on_animation_player_animation_finished(anim_name):
	Global.has_won = true
	Global.game_over = true
