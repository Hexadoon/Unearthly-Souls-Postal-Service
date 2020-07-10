extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mail = []
var mail_type = ["Letter", "Box", "Document"]
var timer = 9
export var wait_time = 10
var mail_index = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	#load_scene()
	#pass # Replace with function body.
	print(typeof(get_node("MailNode")))
	create_queue(1, true, false, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > wait_time:
		timer = 0
		spawn_object(mail_index)
		mail_index += 1
		print("timer passed")
	#if get_position().x > get_viewport().size.x:
	#	print("passed the wall")
	


func load_scene():
	#autopopulate array of mail with random pieces of mail
	pass
	
func create_queue(_ratio, letters, boxes, docs):
	#if
	for i in range(100):
		#mail[i] = mail_type[randi() % mail_type.size() ]
		mail.append("Letter")
	

func spawn_object(mail_index):
	#need to add object to node view as a child
	var mail_res = load("res://Scenes/%s.tscn" % mail[mail_index])
	var mail_node = mail_res.instance()
	#mail_node.set_position(start of conveyor belt)
	get_node("MailNode").add_child(mail_node)
	return mail_node
	
	
func clear_level():
	pass
