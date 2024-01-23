extends Timer
@export var next_scene = "res://scenes/main.tscn"

func _ready():
	set_wait_time(Global.speed * -10)
	print(self.get_wait_time())
	self.start()

func _process(delta):
	$Label.text = str(self.time_left)
	if self.time_left < 0.1:
		Global.game_over = true
		get_tree().change_scene_to_file(next_scene)
