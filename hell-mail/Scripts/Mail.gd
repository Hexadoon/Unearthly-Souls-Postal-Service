extends KinematicBody2D

var addresses = ["Plains of Pain", "Tartarus Fields", "Dungeon Drive", 
"Flaming Falls", "Lavaside Lane", "Seven Circles", "Golden Gates Station", 
"Celestial Court", "Elysium Park", "Lazy Cloud Bluff", "Eden Gardens", 
"Silver Shores"]
var from_addresses
var to_addr
var to_address
var from_address
var valid_address #bool

var names = ["Beelzebub", "Alastor", "Andras", "Baal", "Barbatos", "Dantalion", 
"Demogorgon", "Focalor", "Gamigin", "Malthus", "Legion", "Lucifer", "Mammon", 
"Orobas", "Paimon", "Raum", "Sitri", "Ukobach", "Xaphan", "Armaros", "Azriel", 
"Imamiah", "Batariel", "Mebahiah", "Daniel", "Netzach", "Gadreel", "Penemue", 
"Zuriel", "Sachiel", "Kushiel", "Uriel", "Nanael", "Vehuel", "Grigori", 
"Michael", "Yomiel", "Gabriel", "Raphael", "Raziel", "Ophaniel", "Ramiel", "Samael"]
var from_names
var to_person
var from_person


export (int) var gravity = 400
var can_grab = false
var grabbed_offset = Vector2()
onready var view_area = get_node("/root/World/ViewArea/Area2D")
onready var reject_area = get_node("/root/World/RejChute")
onready var is_rejected = false
onready var TweenNode = get_node("Tween")
var texture

onready var gm = get_node("/root/World/ScoreTracker")
var is_safe
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#print(TweenNode)
	#print(view_area)
	get_node("notifier").connect("screen_exited", self, "_on_screen_exited")
	
	set_validity()
	make_to_label()
	make_from_label()
	if not valid_address:
		mess_up_addr()
	set_labels()
	pass # Replace with function body.

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.doubleclick and not view_area.is_occupied and not can_grab:
			#print("double click pressed")
			TweenNode.interpolate_property(self, "position", get_position(), view_area.get_position(), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			TweenNode.start()
			#print("playtween")
		
		if not gm.is_grabbing:	
			can_grab = event.pressed
			gm.is_grabbing = can_grab
			print("can grab: "+ str(gm.is_grabbing))
			grabbed_offset = position - get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab and not is_rejected and gm.is_grabbing: 
		position = get_global_mouse_position() + grabbed_offset
	
	if  Input.is_action_just_released("left click"):	
		can_grab = false	
		gm.is_grabbing = false
func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	#move_and_collide(velocity)
	#for i in get_slide_count():
		#var collision = get_slide_collision(i)
		#print("I collided with ", collision.collider.name)


	
func set_gravity(new_gravity):
	var old_grav = gravity
	gravity = new_gravity
	return old_grav
	
func set_validity():
	var chance = (randi() % 100)
	#print(chance)
	if ( chance < 40):
		valid_address = false
	else:
		valid_address = true
		
		
func get_type_all():
	return "Mail"
	
func make_to_label():
	#if valid_address:
	to_person = names[randi()% names.size()]
	to_addr = addresses[randi() % addresses.size()]
	to_address = to_person + "\n" + to_addr
	
	texture = load("res://assets/Stamps/%s.png" % to_addr)
	#print("to address " + to_addr)
	$LabelStamp.texture = texture
	#print(to_person)
	pass
	
func make_from_label():
	from_names = names.duplicate()
	from_names.erase(to_person)
	from_person = from_names[randi() % from_names.size()]
	
	from_addresses = addresses.duplicate()
	from_addresses.erase(to_addr)
	
	#if valid_address:
	from_address = from_person + "\n" + from_addresses[randi() % from_addresses.size()]
	pass
	
func mess_up_addr():
	var chance = randi() % 100
	#if ( chance < 30 ):
	if (chance < 50): #for demo
		#print("correct: " + to_address)
		# mess up location name
		
		var rand = from_addresses[randi() % from_addresses.size()]
		#print(rand)
		var prefix = to_address.rsplit(" ", true, 1)[0]
		var suffix = rand.rsplit(" ", true, 1)[1]
		to_address = prefix + " " + suffix
		#print("wrong: " + to_address)
		$to_label.add_color_override("font_color", Color.red)
	
	#elif (30 <= chance && chance < 50):
		#misspelled name
	else: #for demo
		var new_person = to_person
		var misspell = 3 + randi()% (to_person.length() - 3)
		for i in range(misspell):
			var charnew = char(97 + randi() % 26)
			new_person[randi() % to_person.length()] = charnew
			new_person = new_person.capitalize()
		to_address = to_address.replace(to_person, new_person)
		$to_label.add_color_override("font_color", Color.orange)
		
#	elif (50 <= chance && chance < 75):
#		#incorrect location symbol
#		pass
#	else: 
#		#improper numbering
#		pass
	
	pass

func set_labels():
	#print(to_address)
	#print(from_address)
	$to_label.text = to_address
	$from_label.text = from_address
	
func reject():
	is_rejected = true
	texture = load("res://assets/reject stamp clear.png")
	$RejectionStamp.texture = texture
	$RejectionStamp.set_rotation_degrees((randi() % 100) - 50)	
	self.apply_scale(Vector2(0.7, 0.7))
	TweenNode.interpolate_property(self, "position", get_position(), reject_area.get_position(), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	TweenNode.start()

func _on_screen_exited():
	queue_free()
	
func hide_all():
	$to_label.hide()
	$from_label.hide()
	$RejectionStamp.visible = false
	$LabelStamp.visible = false
	pass
	
func show_all():
	$to_label.show()
	$from_label.show()
	$RejectionStamp.visible = true
	$LabelStamp.visible = true
	pass
	
