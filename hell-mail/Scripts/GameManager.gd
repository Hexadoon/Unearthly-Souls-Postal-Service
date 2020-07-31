extends Node

#===== Scoring variables =======================================================
#export (int) var goal_score = 250
var current_score = 100
onready var goal_label = get_node("/root/World/ScoreTracker/GoalScore")
onready var cur_label = get_node("/root/World/ScoreTracker/CurrentScore")

# Points gained / lost for certain conditions
export (int) var points_lost_reject_good_mail = -10
export (int) var points_lost_wrong_sort = -10
export (int) var points_lost_dang_pack = -10
export (int) var points_lost_soul_docs = -10
export (int) var points_won = 30
export (int) var points_won_reject_bad_mail = 10

#===== Timer variables =========================================================
# Total length of a single round
export (int) var total_game_time = 120
# Time between each mail spawn
export (int) var time_btwn_mail = 10
# How long you need to hold mail in front of its slot to enter
export (int) var hold_time = 2
# Speed of the conveyor belt
export (int) var speed = 100
var timer = 0
var paused = false

var is_grabbing = false
#onready var num_level = global.level
#===============================================================================


func _ready():
	set_score_text()
	time_btwn_mail -= (0.5 * global.level)
	hold_time -= (0.1 * global.level)
	
func _process(delta):
	set_score_text()
	if not paused:
		timer += delta
		clock_tick()
	if current_score < 0:
		get_node("/root/World/LoseScreen/ColorRect").visible = true
		get_node("/root/World/LoseScreen/LosePopup").show()
		get_tree().paused = true
	if timer > total_game_time:
		timer = 0
		if current_score < global.goal_score:
			get_node("/root/World/LoseScreen/ColorRect").visible = true
			get_node("/root/World/LoseScreen/LosePopup").show()
			get_tree().paused = true
			#play some losing animation
			#get_tree().reload_current_scene()
		else:
			if global.level == 9:
				get_node("/root/World/WinScreen/WinPopup/Label").text = "You beat the game! :)" 
			get_node("/root/World/WinScreen/ColorRect").visible = true
			get_node("/root/World/WinScreen/WinPopup").show()
			get_tree().paused = true
			

func set_score_text(): 
	goal_label.text = "Goal: " + str(global.goal_score) 
	cur_label.text = "Current: " + str(current_score)


# Getting and setting functions for the score
func get_score():
	return current_score

func set_score(change):
	current_score += change
	return current_score
	

func clock_tick():
	var x = 240.0 * timer / total_game_time 
	get_node("/root/World/Clock/HourHand").set_rotation_degrees(x)
