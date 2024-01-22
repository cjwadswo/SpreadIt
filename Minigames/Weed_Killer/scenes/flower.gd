extends Area2D
var startvar = 0

func _ready():
	$Sprite.pause()

func _process(delta):
	startvar += 0.5 * delta
	var overlapping_areas = get_overlapping_areas()
	if startvar > 1:
		if overlapping_areas.size() < 1:
			$Sprite.play()
			Global.score += 1
			modulate = Color.WHITE
