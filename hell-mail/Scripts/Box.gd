extends "res://Scripts/Mail.gd"

var items = ["axe", "book", "chicken", "chocolate", "cookie", "dynamite", 
			"mace", "paint", "poison", "sock", "spear"]
var good_items = ["book", "chocolate", "cookie", "paint", "sock"]

var slots = ["1", "2", "3", "4", "5"]


func _ready():
	randomize()
	var texture = load("res://assets/Boxes/box%s.png" % str(randi() % 4 + 1))
	$Sprite.texture = texture
	put_items()

func get_type():
	return "Box"

func put_items():
	#var num_items = (randi() % 4) + 1
	# 1 - 3 items spawn per box
	var num_items = (randi() % 2) + 1
	if global.level >= 5:
		num_items += randi() % 2
	# maybe chances with regards to valid_address?
	if (randi() % 100) < (65 - global.level * 2): 
		is_safe = true	
	else:
		is_safe = false
	
	if is_safe:
		var slots_dup = slots.duplicate()
		for i in range(num_items):	
			var rand_slot = randi() % slots_dup.size()
			var rand_obj = good_items[randi() % good_items.size()]
			get_node("Sprite%s" % slots_dup[rand_slot]).texture = load("res://assets/BoxItems/%s.png" % rand_obj)
			get_node("Sprite%s" % slots_dup[rand_slot]).set_rotation_degrees(randi() % 360)
			slots_dup.erase(rand_slot)
	else:
		var slots_dup = slots.duplicate()
		for i in range(num_items):
			var rand_slot = randi() % slots_dup.size()
			print(rand_slot)
			var rand_obj = items[randi() % items.size()]
			get_node("Sprite%s" % slots_dup[rand_slot]).texture = load("res://assets/BoxItems/%s.png" % rand_obj)
			get_node("Sprite%s" % slots_dup[rand_slot]).set_rotation_degrees(randi() % 360)
			slots_dup.erase(rand_slot)
	
	
