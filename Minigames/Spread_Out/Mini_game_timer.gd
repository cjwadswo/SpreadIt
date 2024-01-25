extends Timer

var countdown_timer : Timer = self  # Replace with the actual path to your Timer node
var countdown_label : Label # Replace with the actual path to your Label node
var countdown_duration : int = 8
var parent_node
func _ready():
	# Connect the Timer's timeout signal to a function
	# Start the Timer
	countdown_timer.start()
	countdown_label = get_parent().get_node("TimerLabel")
	parent_node = get_parent()
	print(countdown_label.text)

func _on_timeout():
	# Update the countdown duration
	if !parent_node.has_won :
		countdown_duration -= 1

		# Update the Label text
		countdown_label.text = "" + str(countdown_duration)

		# Check if the countdown has reached zero
		if countdown_duration <= 0:
			countdown_timer.stop()
			countdown_label.text = "Countdown finished!"
			print("Countdown finished. Do something here.")
		else:
			print("Time left:", countdown_duration)
