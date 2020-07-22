extends StaticBody2D

export var speed = 100

func _ready():
	constant_linear_velocity.x = speed
	
	
func _process(delta):
	$Sprite.texture.region.position.x -= speed * delta



