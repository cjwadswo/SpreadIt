extends Node2D
var draggable_nodes
var draggable_count : int
var has_won : bool = false
var has_won_text : Label
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#generate draggable objects
	
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
		if node.is_in_area == true:
			count += 1
	if count == draggable_count:
		has_won = true
		has_won_text.visible = true
		
		


func _on_timer_timeout():
	get_node("MinigameText").visible = false
