extends Node

func _ready():
	var file = File.new()
	file.open("res://Scripts/names.tres", File.READ)
	var content = file.get_as_text()
	var arr = content.split("\n", false, 0)
	print(arr)
	file.close()
	var stringer = ""
	for i in range(arr.size()):
		stringer += "\""+ arr[i] + "\", "
		
	print (stringer)
		
	return content
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

