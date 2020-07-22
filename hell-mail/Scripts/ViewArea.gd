extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var grav
var viewing_mail = null
onready var gm = get_node("/root/World/ScoreTracker")
var is_occupied = false
# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', self, 'on_mail_body_enter')
	connect('body_exited', self, 'on_mail_body_exit')
	connect('area_entered', self, 'on_stamp_enter')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_mail_body_enter(body):
	if body.get_type() == "Mail":
		print(body, "entered viewarea")
		grav = body.set_gravity(0)
		body.apply_scale(Vector2(2.0, 2.0))
		viewing_mail = body
		is_occupied = true
		
	
func on_stamp_enter(area):
	if area.get_name() == "RejectionStamp":
		print(area, "entered viewarea")
		if viewing_mail != null:
			if viewing_mail.valid_address:
				gm.set_score(gm.points_lost_reject_good_mail)
			else:
				gm.set_score(gm.points_won_reject_bad_mail)
			viewing_mail.reject()

	
func on_mail_body_exit(body):
	if body.get_type() == "Mail":
		print(body, "exited  viewarea")
		body.set_gravity(grav)
		body.apply_scale(Vector2(0.5, 0.5))
		viewing_mail = null
		is_occupied = false

