extends Node2D

var score_label
var lives_label

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label = $Score
	lives_label = $Lives	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_label.text = str("Score: ",Global.score)
	lives_label.text = str("Lives ", Global.lives)
