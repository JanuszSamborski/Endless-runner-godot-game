extends Label

var score_node
func _ready():
	score_node = get_node('../Score')
	pass

func _process(delta):
	set_text("Score: " + str(score_node.get_score()) + "\nMax score: " + str(score_node.get_max_score()))
	pass
