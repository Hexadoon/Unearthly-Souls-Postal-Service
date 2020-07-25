extends StaticBody2D
onready var gm = get_node("/root/World/ScoreTracker")
var speed

func _ready():
	speed = gm.speed
	constant_linear_velocity.x = speed
	
# comment out this function later once you get the actual conv belt & animate it
func _process(delta):
	$Sprite.texture.region.position.x -= speed * delta



