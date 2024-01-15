extends Area2D

func _ready():
	$Sprite.pause()

func _process(delta):
	var overlapping_areas = get_overlapping_areas()
	if overlapping_areas.size() < 1:
		$Sprite.play()
		Global.score += 1
		modulate = Color.WHITE
