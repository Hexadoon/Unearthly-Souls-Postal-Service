extends "res://Scripts/Button.gd"
onready var dropdown = self


func _ready():
	dropdown.connect("item_selected", self, "on_item_selected")
	add_levels()

func add_levels():
	var file = File.new()
	file.open("res://assets/load_level.tres", File.READ)
	var content = file.get_as_text()
	var arr = content.split("\n", false, 0)
	dropdown.add_item(" ")
	dropdown.set_item_disabled(0, true)
	for i in arr.size():
		dropdown.add_item("Level " + str(i + 1))

func on_item_selected(id):
	var text = str(dropdown.get_item_text(id))
	text = text.rsplit(" ", false, 1)[1]
	#print(text)
	#gm.set_level(int(text[-1]) - 1)
	global.level = int(text) - 1
	get_tree().change_scene("res://Scenes/main.tscn")
