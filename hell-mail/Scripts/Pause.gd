extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.visible = false
	
	for button in $pause_popup.get_children():
		print(typeof(button))
		button.connect("pressed", self, "on_Button_pressed", [button.button_name])


func _input(event):
	if event is InputEventKey and event.scancode == KEY_P:
		get_tree().paused = true
		$Background.visible = true
		$pause_popup.show()
	
func on_Button_pressed(button_name):
	print(button_name)
	match button_name:
		"Resume":
			$Background.visible = false
			$pause_popup.hide()
			get_tree().paused = false
		"Restart":
			$Background.visible = false
			$pause_popup.hide()
			get_tree().paused = false
			get_tree().reload_current_scene()
		"Quit":
			get_tree().quit()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
