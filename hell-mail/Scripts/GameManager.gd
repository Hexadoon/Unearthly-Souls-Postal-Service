extends Node

var current_score = 100
export (int) var goal_score

export (int) var points_lost_reject_good_mail = -10
export (int) var points_lost_wrong_sort = -10
export (int) var points_lost_dang_pack = -10
export (int) var points_lost_soul_docs = -10
export (int) var points_won = 30
export (int) var points_won_reject_bad_mail = 10

var timer = 0
var paused = false
export (int) var total_game_time = 60
export (int) var time_btwn_mail = 10

onready var goal_label = get_node("/root/World/ScoreTracker/GoalScore")
onready var cur_label = get_node("/root/World/ScoreTracker/CurrentScore")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#current_score = 0
	goal_score = 1000
	set_score_text()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_score_text()
	if not paused:
		timer += delta
	if timer > total_game_time:
		timer = 0
		if current_score < goal_score:
			#play some losing animation
			get_tree().reload_current_scene()
#	pass

func set_score_text(): 
	goal_label.text = "Goal: " + str(goal_score) #+ "\n Current: "+ str(current_score)
	cur_label.text = "Current: " + str(current_score)

func get_score():
	return current_score

func set_score(change):
	current_score += change
	return current_score
