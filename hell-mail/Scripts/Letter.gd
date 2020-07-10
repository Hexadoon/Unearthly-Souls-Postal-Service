extends "res://Scripts/Mail.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#
#var textures = ['mage_f.png', 'mage_m.png',
#                'healer_f.png', 'healer_m.png',
#                'townfolk1_f.png', 'townfolk1_m.png']

var textures = ['icon.png', 'unicorn.jpg', 'yellowyoshi.jpg']
# Called when the node enters the scene tree for the first time.
func _ready():
	#randomize()
	#var texture = textures[randi() % textures.size()]
	#texture = load("res://(PATH TO TEXTURE)'/%s" % texture)
	#$Sprite.texture = texture
	#https://kidscancode.org/blog/2018/01/godot3_inheritance/
	
	randomize()
	var texture = textures[randi() % textures.size()]
	texture = load("res://Sprites/%s" % texture)
	$Sprite.texture = texture
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
