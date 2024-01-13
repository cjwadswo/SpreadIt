extends StaticBody2D
var is_grabable : bool = false
var is_currently_grabbed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#If mouse entered but didn't exit and a click is detected. Move and translate the character to where the mouse goes
	if is_grabable and Input.is_action_just_pressed("Click") || is_currently_grabbed:
		grab()
	if Input.is_action_just_released("Click"):
		release()

func grab():
	is_currently_grabbed = true
	var mouse_position = get_global_mouse_position()
	global_position = mouse_position

func release():
	is_currently_grabbed = false

func _on_mouse_entered():
	is_grabable = true


func _on_mouse_exited():
	is_grabable = false
