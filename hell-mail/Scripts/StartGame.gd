extends Node

var mail = []
#var mail_type = ["Letter", "Box", "Document"]
var mail_type = ["Letter", "Box"]
var timer = 9
var wait_time
var mail_index = 0
var lvl
var level_dir = {}
onready var gm = get_node("/root/World/ScoreTracker")


func _ready():
	load_level_info()
	#load_scene()
	#pass # Replace with function body.
	#print(typeof(get_node("MailNode")))
	lvl = global.level
	#create_queue(100 , 0)
	#print(lvl)
	#print(level_dir)
	create_queue(level_dir[str(lvl)][0],level_dir[str(lvl)][1])
	wait_time = gm.time_btwn_mail



func _process(delta):
	timer += delta
	if timer > wait_time:
		timer = 0
		spawn_object(mail_index)
		mail_index += 1


func create_queue(lratio, bratio):
	for i in range(100):
		var chance = randi() % 100
		if (chance < lratio):
			mail.append("Letter")
		elif (lratio <= chance) or (chance < lratio + bratio):
			mail.append("Box")
		#mail.append(mail_type[randi() % mail_type.size() ])
		
	

func spawn_object(mail_index):
	#need to add object to node view as a child
	#print(mail[mail_index])
	var mail_res = load("res://Scenes/%s.tscn" % mail[mail_index])
	var mail_node = mail_res.instance()
	if mail[mail_index] == "Letter":
		mail_node.apply_scale(Vector2(0.3, 0.3))
	elif mail[mail_index] == "Box":
		mail_node.apply_scale(Vector2(0.3, 0.3))
	mail_node.hide_all()
	mail_node.set_position(get_node("MailNode/SpawnPos").get_position())
	get_node("MailNode").add_child(mail_node)
	return mail_node
	
	
func clear_level():
	pass

func load_level_info():
	var file = File.new()
	file.open("res://assets/load_level.tres", File.READ)
	var content = file.get_as_text()
	var arr = content.split("\n", false, 0)
	for i in arr.size():
		var ratios = arr[i].split(",", false, 2)
		level_dir[str(i)] = []
		level_dir[str(i)].append(int(ratios[0].strip_edges()))
		level_dir[str(i)].append(int(ratios[1].strip_edges()))
		#print(level_dir[str(i)])
	file.close()
