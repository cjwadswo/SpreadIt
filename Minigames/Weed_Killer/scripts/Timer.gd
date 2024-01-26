extends Timer
@export var next_scene = "res://scenes/main.tscn"

func _ready():
	self.start()

func _process(delta):
	$Label.text = str(self.time_left)
	if self.time_left <= 0.1:
		Global.game_over = true
