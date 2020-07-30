extends Button


func _ready():
	var exit_but = get_node("/root/World/PosterLayer/guide_popup/exit_button")
	exit_but.connect("pressed", self, "on_exit_but_pressed")
	
	var exit_but2 = get_node("/root/World/PosterLayer/contraband_popup/exit_button")
	exit_but2.connect("pressed", self, "on_exit_but_pressed")
	
	var exit_but3 = get_node("/root/World/PosterLayer/accepted_popup/exit_button")
	exit_but3.connect("pressed", self, "on_exit_but_pressed")

	var exit_but4 = get_node("/root/World/HelpLayer/help_popup/exit_button")
	exit_but4.connect("pressed", self, "on_exit_but_pressed2")
	
	
func on_exit_but_pressed():
	#get_node("/root/World/PosterLayer/guide_popup").hide()
	#print(self.get_parent())
	get_parent().hide()
	get_node("/root/World/PosterLayer/Background").visible = false
	get_tree().paused = false

func on_exit_but_pressed2():
	get_parent().hide()
	get_tree().paused = false
