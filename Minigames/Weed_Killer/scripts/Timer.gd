extends Timer
signal out_of_time

func _ready():
	self.start()

func _process(delta):
	$Label.text = str(self.time_left)
	if self.time_left < 0.1:
		out_of_time.emit()
