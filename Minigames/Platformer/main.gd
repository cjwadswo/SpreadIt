extends Node2D
@export var transitioner : Transitioner

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.has_won = false
	Global.game_over = false
	get_node("Transitions/AnimationPlayer").play("Fade_in")
	#get_node("../Transitions/AnimationPlayer").play("Fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
