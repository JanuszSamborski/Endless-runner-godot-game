extends Spatial


func _ready():
	pass

var time : float = 0
func _process(delta):
	time+=delta
	if time > 2:
		time = 0
		print_tree()
	pass
