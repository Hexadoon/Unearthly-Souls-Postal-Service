extends "res://Scripts/Mail.gd"

var textures = ['icon.png', 'unicorn.jpg', 'yellowyoshi.jpg']

func _ready():
	randomize()
	var texture = load("res://assets/bigbackofmail.png")
	$Sprite.texture = texture
	is_safe = true


func get_type():
	return "Letter"
	

#func _process(delta):
#	pass
