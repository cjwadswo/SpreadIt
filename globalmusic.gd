extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play_music()
	
func _process(delta):
	pass

func play_music():
	play()
