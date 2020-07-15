extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var pause_but = get_node("/root/World/PunchOutCard")
	pause_but.connect("pressed", self, "on_pause_but_pressed")
	pass # Replace with function body.

func on_pause_but_pressed():
	get_tree().paused = true
	get_node("/root/World/PauseLayer/Pause/Background").visible = true
	get_node("/root/World/PauseLayer/Pause/pause_popup").show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
