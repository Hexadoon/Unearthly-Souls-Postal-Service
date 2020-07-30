extends Area2D

onready var gm = get_node("/root/World/ScoreTracker")

func _ready():
	self.connect("body_entered", self, "on_mail_enter")
	self.connect("body_exited", self, "on_mail_exit")

func on_mail_enter(body):
	#if body.get_type() == "Box" and body.can_grab:
	#	body.apply_scale(Vector2(0.75, 0.75))
	pass
func on_mail_exit(body):
	#if body.get_type() == "Box" and body.can_grab:
	#	body.apply_scale(Vector2(4.0/3, 4.0/3))
	pass
