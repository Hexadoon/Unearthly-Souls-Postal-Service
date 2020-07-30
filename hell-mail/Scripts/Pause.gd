extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$pause_popup/Background.visible = false
	#$pause_popup.hide()
	deactivate()
	for button in $pause_popup.get_children():
		if button is Button:
		#	print(typeof(button))
			button.connect("pressed", self, "on_Button_pressed", [button.button_name])


func _input(event):
	if event is InputEventKey and event.scancode == KEY_P:
		get_tree().paused = true
		#$Background.visible = true
		#$pause_popup.show()
		activate()
	
func on_Button_pressed(button_name):
	#print(button_name)
	match button_name:
		"Resume":
			#$Background.visible = false
			#$pause_popup.hide()
			deactivate()
			get_tree().paused = false
		"Restart":
			#$Background.visible = false
			#$pause_popup.hide()
			deactivate()
			get_tree().paused = false
			get_tree().reload_current_scene()
		"Quit":
			get_tree().quit()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func deactivate():
	
	$pause_popup.hide()
	$pause_popup.set_process(false)
	$pause_popup.set_physics_process(false)
	$pause_popup.set_process_unhandled_input(false)
	$pause_popup.set_process_input(false)
	$pause_popup/Background.visible = false
	
func activate():
	$pause_popup.show()
	$pause_popup.set_process(true)
	$pause_popup.set_physics_process(true)
	$pause_popup.set_process_unhandled_input(true)
	$pause_popup.set_process_input(true)
	$pause_popup/Background.visible = true
