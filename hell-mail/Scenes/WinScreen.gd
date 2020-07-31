extends Node

onready var gm = get_node("/root/World/ScoreTracker")
func _ready():
	$ColorRect.visible = false
	$WinPopup.hide()
	for button in $WinPopup.get_children():
		if button is Button:
		#	print(typeof(button))
			button.connect("pressed", self, "on_Button_pressed", [button.button_name])

	pass # Replace with function body.

	
func on_Button_pressed(button_name):
	#print(button_name)
	match button_name:
		"Next":
			var reduce = (gm.current_score - global.goal_score) / 5
			if reduce > 100: reduce = 100
			global.level += 1
			global.goal_score = global.goal_score - reduce
			if global.goal_score <= 100: global.goal_score = 100
			get_tree().reload_current_scene()
			#$Background.visible = false
			#$pause_popup.hide()
			get_tree().paused = false
		"Start":
			get_tree().change_scene("res://Scenes/StartScene.tscn")
			get_tree().paused = false
		"Quit":
			get_tree().quit()	
