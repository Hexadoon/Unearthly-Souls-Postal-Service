extends Area2D


func _ready():
	connect('body_entered', self, 'on_mail_body_enter')

func on_mail_body_enter(body):
	#print(body.get_name())
	#print(body.get_type())
	if body.get_type_all() == "Mail":
		body.queue_free()
