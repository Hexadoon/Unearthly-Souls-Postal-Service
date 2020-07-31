extends Node

onready var gm = get_node("/root/World/ScoreTracker")
func _ready():
	$ColorRect.visible = false
	$LosePopup.hide()
	for button in $LosePopup.get_children():
		if button is Button:
		#	print(typeof(button))
			button.connect("pressed", self, "on_Button_pressed", [button.button_name])

	pass # Replace with function body.

	
func on_Button_pressed(button_name):
	print(button_name)
	match button_name:
		"Retry":
			get_tree().reload_current_scene()
			#$Background.visible = false
			#$pause_popup.hide()
			get_tree().paused = false
		"Start":
			get_tree().change_scene("res://Scenes/StartScene.tscn")
		"Quit":
			get_tree().quit()	
