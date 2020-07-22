extends Area2D

#export (int) var gravity = 0
var can_grab = false
var grabbed_offset = Vector2()
var velocity = Vector2.ZERO
onready var TweenNode = get_node("Tween")
onready var rejstamp_area = get_node("/root/World/RejStampArea/SpawnPos").get_position()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		print("rej stamp can grab: "+ str(can_grab))
		grabbed_offset = position - get_global_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
	
	if  Input.is_action_just_released("left click"):
		#print("Left mouse button released.")
		#play animation of stamping
		TweenNode.interpolate_property(self, "position", get_position(), rejstamp_area, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		TweenNode.start()
		
