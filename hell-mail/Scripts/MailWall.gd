extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 0
var timer_on = false
export (int) var hold_time = 2
var grabbed #bool
onready var gm = get_node("/root/World/ScoreTracker")
var addr
var valid

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
	if timer >= hold_time:
		print("can enter")
		print("address is " + addr)
		print("valid? " + str(valid))
		print("grabbed? " + str(grabbed))
		if (addr == self.name) && valid && grabbed:
				gm.set_score(gm.points_won)
		elif (addr != self.name) || not valid:
			gm.set_score(gm.points_lost_wrong_sort)
		timer = 0
		timer_on = false
		#mail_being_handled.can_grab = false
		mail_being_handled.queue_free()
		
	pass

func on_mail_enter(body):
	if body.get_type() == "Mail":
		addr = body.to_address.split("\n", true, 1)[1]
		grabbed = body.can_grab
		valid = body.valid_address
		start_timer()
		print(self.name)
		mail_being_handled = body
			
func on_mail_exit(body):
	timer = 0
	timer_on = false

func start_timer():
	timer_on = true
	
	pass
