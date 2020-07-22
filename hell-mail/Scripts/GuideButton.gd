extends Button

func _ready():
	var guide_but = get_node("/root/World/GuideButton")
	guide_but.connect("pressed", self, "on_guide_but_pressed")
	
	var exit_but = get_node("/root/World/PosterLayer/guide_popup/exit_button")
	exit_but.connect("pressed", self, "on_exit_but_pressed")

func on_guide_but_pressed():
	get_tree().paused = true
	get_node("/root/World/PosterLayer/guide_popup").show()
	
func on_exit_but_pressed():
	get_node("/root/World/PosterLayer/guide_popup").hide()
	get_tree().paused = false
	

