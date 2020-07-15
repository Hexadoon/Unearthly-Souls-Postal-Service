extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	var guide_but = get_node("/root/World/GuideButton")
	guide_but.connect("pressed", self, "on_guide_but_pressed")
	
	
	var exit_but = get_node("/root/World/guide_popup/exit_button")
	exit_but.connect("pressed", self, "on_exit_but_pressed")
	pass # Replace with function body.

func on_guide_but_pressed():
	get_tree().paused = true
	get_node("/root/World/guide_popup").show()
	
func on_exit_but_pressed():
	get_node("/root/World/guide_popup").hide()
	get_tree().paused = false
	

