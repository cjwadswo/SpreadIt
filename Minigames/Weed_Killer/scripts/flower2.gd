extends Area2D
var startvar = 0
signal emitscore()

func _ready():
	if Global.speed > 2.0:
		self.visible = true
	$Sprite.pause()
	var startpos = Vector2(randf_range(32,320), randf_range(50,440))
	position = startpos

func _process(delta):
	startvar += 0.5 * delta
	var overlapping_areas = get_overlapping_areas()
	if startvar > 1:
		if overlapping_areas.size() < 1:
			set_process(false)
			$Sprite.play()
			modulate = Color.WHITE
			if self.visible == true:
				emitscore.emit()
