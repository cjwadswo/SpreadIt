extends Timer

func _ready():
	self.start()

func _process(delta):
	$Label.text = str(self.time_left)
	if self.time_left < 0.1:
		Global.game_over = true
