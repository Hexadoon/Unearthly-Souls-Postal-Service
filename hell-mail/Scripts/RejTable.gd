extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', self, 'on_mail_body_enter')

func on_mail_body_enter(body):
	#print(body.get_name())
	#print(body.get_type())
	if body.get_type() == "Mail":
		print(body, "entered area")
		body.set_gravity(0)
