extends "res://Scripts/Mail.gd"

var textures = ['icon.png', 'unicorn.jpg', 'yellowyoshi.jpg']
# Called when the node enters the scene tree for the first time.
func _ready():
	#randomize()
	#var texture = textures[randi() % textures.size()]
	#texture = load("res://(PATH TO TEXTURE)'/%s" % texture)
	#$Sprite.texture = texture
	#https://kidscancode.org/blog/2018/01/godot3_inheritance/
	
	randomize()
	var texture = load("res://assets/bigbackofmail.png")
	$Sprite.texture = texture
	is_safe = true
	#pass # Replace with function body.

func get_type():
	return "Letter"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
