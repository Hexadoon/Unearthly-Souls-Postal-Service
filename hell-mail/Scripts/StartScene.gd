extends Control

func _ready():
	for button in $Buttons.get_children() :
		button.connect("pressed", self, "on_button_pressed", [button.button_name])

func on_button_pressed(button_name):
	match button_name:
		"Start":
			global.level = 0
			get_tree().change_scene("res://Scenes/main.tscn")
		"Load":
			pass
		"Exit": 
			get_tree().quit()
		"Credits":
			get_tree().change_scene("res://Scenes/Credits.tscn")
	pass
