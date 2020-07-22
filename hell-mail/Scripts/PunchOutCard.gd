extends Button


func _ready():
	var pause_but = get_node("/root/World/PunchOutCard")
	pause_but.connect("pressed", self, "on_pause_but_pressed")


func on_pause_but_pressed():
	get_tree().paused = true
	get_node("/root/World/PauseLayer/Pause/Background").visible = true
	get_node("/root/World/PauseLayer/Pause/pause_popup").show()
