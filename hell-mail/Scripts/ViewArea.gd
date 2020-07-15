extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var grav
# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', self, 'on_mail_body_enter')
	connect('body_exited', self, 'on_mail_body_exit')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_mail_body_enter(body):
	if body.get_type() == "Mail":
		print(body, "entered viewarea")
		grav = body.set_gravity(0)
		body.apply_scale(Vector2(2.0, 2.0))
	pass
	
func on_mail_body_exit(body):
	if body.get_type() == "Mail":
		print(body, "exited  viewarea")
		body.set_gravity(grav)
		body.apply_scale(Vector2(0.5, 0.5))
	pass
