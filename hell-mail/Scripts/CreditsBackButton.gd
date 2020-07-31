extends Button



func _ready():
	var back_but = self
	back_but.connect("pressed", self, "on_but_pressed")
	pass # Replace with function body.


func on_but_pressed():
	get_tree().change_scene("res://Scenes/StartScene.tscn")
