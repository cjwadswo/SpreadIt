extends AudioStreamPlayer

func _ready():
	play_music()

func _on_finished():
	play_music()

func play_music():
	play()
