extends Area2D

#export (int) var gravity = 0
var can_grab = false
var grabbed_offset = Vector2()
var velocity = Vector2.ZERO
onready var TweenNode = get_node("Tween")
onready var rejstamp_area = get_node("/root/World/RejStampArea/SpawnPos").get_position()
onready var view_area = get_node("/root/World/ViewArea/Area2D")


func _ready():
	pass 


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		#print("rej stamp can grab: "+ str(can_grab))
		grabbed_offset = position - get_global_mouse_position()



func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
		#print("prob in rej stamp")
	
	if  Input.is_action_just_released("left click"):
		#print("Left mouse button released.")
		#play animation of stamping
		TweenNode.interpolate_property(self, "position", get_position(), rejstamp_area, 0.6, Tween.TRANS_SINE, Tween.EASE_OUT)
		TweenNode.start()
		can_grab = false
		
