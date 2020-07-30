extends Area2D
onready var gm = get_node("/root/World/ScoreTracker")

func _ready():
	connect('body_entered', self, 'on_mail_body_enter')
	#pass # Replace with function body.

#func _on_body_enter(body):
#	print(str('Body entered: ', body.get_name()))

func on_mail_body_enter(body):
	#print(body.get_name())
	#print(body.get_type())
	if body.get_type_all() == "Mail":
		print(body, "entered area")
		
		#get_node("MailNode").remove_child(body)
		body.queue_free()
		gm.set_score(gm.points_lost_dang_pack)
		#gm.current_score -= 10
		#print(gm.current_score)

		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
