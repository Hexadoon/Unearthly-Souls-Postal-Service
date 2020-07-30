extends Button
export (String) var popup
func _ready():
	var guide_but = get_node("/root/World/PosterButtons/GuideButton")
	guide_but.connect("pressed", self, "on_guide_but_pressed", [guide_but.popup])
	
	var contra_but = get_node("/root/World/PosterButtons/ContrabandButton")
	contra_but.connect("pressed", self, "on_guide_but_pressed", [contra_but.popup])
	
	var accept_but = get_node("/root/World/PosterButtons/AcceptedButton")
	accept_but.connect("pressed", self, "on_guide_but_pressed", [accept_but.popup])
	
	

func on_guide_but_pressed(popup_name):
	get_tree().paused = true
	var path = "/root/World/PosterLayer/" + popup_name + "_popup"
	#print(path)
	get_node("/root/World/PosterLayer/Background").visible = true
	get_node(path).show()
	

	

