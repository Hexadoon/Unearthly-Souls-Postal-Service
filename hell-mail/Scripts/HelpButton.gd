extends Button

func _ready():
	var help_but = get_node("/root/World/HelpButton")
	help_but.connect("pressed", self, "on_help_but_pressed")


func on_help_but_pressed():
	get_tree().paused = true
	get_node("/root/World/HelpLayer/help_popup").show()
	#get_node("/root/World/PauseLayer/Pause/pause_popup").show()
	#get_node("/root/World/PauseLayer/Pause").activate()
