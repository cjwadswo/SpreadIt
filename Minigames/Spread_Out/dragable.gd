extends Area2D
var is_grabbable : bool = false
var is_currently_grabbed : bool = false
var is_in_area : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#If mouse entered but didn't exit and a click is detected. Move and translate the character to where the mouse goes
	if is_grabbable and Input.is_action_just_pressed("Click") || is_currently_grabbed:
		grab()
	if Input.is_action_just_released("Click"):
		release()

func grab():
	is_currently_grabbed = true
	var mouse_position = get_global_mouse_position()
	self.global_position = mouse_position

func release():
	is_currently_grabbed = false

func _on_mouse_entered():
	is_grabbable = true


func _on_mouse_exited():
	is_grabbable = false
