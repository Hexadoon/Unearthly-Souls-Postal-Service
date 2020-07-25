extends Node2D

onready var gm = get_node("/root/World/ScoreTracker")
#Timer variables
#export (int) var hold_time = 2
var timer = 0
var timer_on = false

var grabbed #bool

var addr
var valid
var safe

var mail_being_handled

# Called when the node enters the scene tree for the first time.
func _ready():
	#for slot in self.get_children():
		#slot.destination = slot.name
	#	slot.connect("body_entered", self, "on_mail_enter")
	#	print(slot.name)
	self.connect("body_entered", self, "on_mail_enter")
	self.connect("body_exited", self, "on_mail_exit")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_on && grabbed:
		timer += delta
		#print("timer!!: " + str(timer))
	if timer >= gm.hold_time:
		#print("can enter")
		#print("address is " + addr)
		#print("valid? " + str(valid))
		#print("grabbed? " + str(grabbed))
		print("safe? " + str(safe))
		print("final mail slot: " + self.name)
		if not safe:
			gm.set_score(gm.points_lost_dang_pack)
			
		elif (addr == self.name) && valid && grabbed && safe:
			gm.set_score(gm.points_won)
			
		elif (addr != self.name) || not valid:
			gm.set_score(gm.points_lost_wrong_sort)
		timer = 0
		timer_on = false
		#mail_being_handled.can_grab = false
		mail_being_handled.queue_free()
		
	pass

func on_mail_enter(body):
	if body.get_type_all() == "Mail":
		if body.get_type() == "Box":
			body.apply_scale(Vector2(0.75, 0.75))
		addr = body.to_address.split("\n", true, 1)[1]
		grabbed = body.can_grab
		valid = body.valid_address
		safe = body.is_safe
		start_timer()
		#print(self.name)
		mail_being_handled = body
			
func on_mail_exit(body):
	timer = 0
	timer_on = false
	if body.get_type() == "Box":
		body.apply_scale(Vector2(4.0/3, 4.0/3))

func start_timer():
	timer_on = true
	
	pass
