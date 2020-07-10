extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100

#Called when the node enters the scene tree for the first time.
func _ready():
	constant_linear_velocity.x = speed
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.texture.region.position.x -= speed * delta



