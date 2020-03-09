extends Node

var pass_time : float = 0
var score : int = 0
var max_score : int = 0

var player_node : Node

func _ready():
	player_node = get_node("/root/Level/Player")
	if player_node.connect("player_died", self, "player_reset") != OK:
		print("player_died signal connect failed in Score node")

func player_reset():
	update_max_score()
	reset_score()

func reset_score():
	score = 0

func get_score():
	return score
	
func get_max_score():
	return max_score

func update_max_score():
	if score>max_score:
		max_score = score
	pass	

func add_points():
	score+=10
	pass

func _process(delta):
	pass_time +=delta
	if pass_time>1:
		pass_time-=1
		score+=1
	pass
