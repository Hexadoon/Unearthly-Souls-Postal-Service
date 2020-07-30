extends Area2D

var grav
var viewing_mail = null
onready var gm = get_node("/root/World/ScoreTracker")
var is_occupied = false
var old_box_text
# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', self, 'on_mail_body_enter')
	connect('body_exited', self, 'on_mail_body_exit')
	connect('area_entered', self, 'on_stamp_enter')
	connect('area_exited', self, 'on_stamp_exit')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_mail_body_enter(body):
	if body.get_type_all() == "Mail":
		print(body, "entered viewarea")
		grav = body.set_gravity(0)
		viewing_mail = body
		is_occupied = true
		body.show_all()
		if body.get_type() == "Letter":	
			body.apply_scale(Vector2(3.0, 3.0))
			
		if body.get_type() == "Box":
			var sprite_text = body.get_node("Sprite").texture
			old_box_text = sprite_text
			body.get_node("Sprite").texture = load("res://assets/reupload/boxhead4.png")
			body.apply_scale(Vector2(3.0, 3.0))
			body.light_mask = 2
			for sprite in body.get_children():
				if sprite is Sprite:
					sprite.light_mask = 2
		
	
func on_stamp_enter(area):
	if area.get_name() == "RejectionStamp":
		print(area, "entered viewarea")
		if viewing_mail != null:
			if viewing_mail.valid_address:
				if viewing_mail.is_safe:
					gm.set_score(gm.points_lost_reject_good_mail)
				else:
					gm.set_score(gm.points_won_reject_bad_mail)
			else:
				gm.set_score(gm.points_won_reject_bad_mail)
			viewing_mail.reject()
	if area.get_name() == "Goggle":
		print(area, "goggles entered viewarea")
		
		if viewing_mail != null && viewing_mail.get_type() == "Box":
			area.get_node("GoggleLight").visible = true
			area.get_node("Sprite").visible = false
			viewing_mail.hide_all()
			

	
func on_mail_body_exit(body):
	if body.get_type_all() == "Mail":
		print(body, "exited  viewarea")
		body.set_gravity(grav)
		viewing_mail = null
		is_occupied = false
		body.hide_all()
		if body.get_type() == "Letter":
			body.apply_scale(Vector2(1.0/3, 1.0/3))
			
			
		if body.get_type() == "Box":
			body.get_node("Sprite").texture = old_box_text
			body.apply_scale(Vector2(1.0/3, 1.0/3))
			body.light_mask = 1
			for sprite in body.get_children():
				if sprite is Sprite:
					sprite.light_mask = 1

func on_stamp_exit(area):
	if area.get_name() == "Goggle":
		print(area, "goggles exited viewarea")
		
		if viewing_mail != null:
			area.get_node("GoggleLight").visible = false
			area.get_node("Sprite").visible = true
			viewing_mail.show_all()
