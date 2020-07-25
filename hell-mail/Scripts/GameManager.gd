extends Node

#===== Scoring variables =======================================================
export (int) var goal_score = 1000
var current_score = 100
onready var goal_label = get_node("/root/World/ScoreTracker/GoalScore")
onready var cur_label = get_node("/root/World/ScoreTracker/CurrentScore")

# Points gained / lost fro certain conditions
export (int) var points_lost_reject_good_mail = -10
export (int) var points_lost_wrong_sort = -10
export (int) var points_lost_dang_pack = -10
export (int) var points_lost_soul_docs = -10
export (int) var points_won = 30
export (int) var points_won_reject_bad_mail = 10

#===== Timer variables =========================================================
# Total length of a single round
export (int) var total_game_time = 100
# Time between each mail spawn
export (int) var time_btwn_mail = 10
# How long you need to hold mail in front of its slot to enter
export (int) var hold_time = 2
# Speed of the conveyor belt
export (int) var speed = 100
var timer = 0
var paused = false

var is_grabbing = false

#===============================================================================


func _ready():
	set_score_text()
	
func _process(delta):
	set_score_text()
	if not paused:
		timer += delta
	if timer > total_game_time:
		timer = 0
		if current_score < goal_score:
			#play some losing animation
			get_tree().reload_current_scene()

func set_score_text(): 
	goal_label.text = "Goal: " + str(goal_score) 
	cur_label.text = "Current: " + str(current_score)


# Getting and setting functions for the score
func get_score():
	return current_score

func set_score(change):
	current_score += change
	return current_score
