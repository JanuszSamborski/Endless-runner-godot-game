extends Spatial
signal reset
var score : int = 0
var top_score : int = 0
var control_node : Node

func _ready():
	control_node = get_node("/root/Main/Control")
	emit_signal("reset")
	pass

func _on_Player_coin():
	$AudioCoin.play()
	score+=GameVariable.COIN_POINTS
	control_node.get_node("./LabelGameScore").set_text("Score: " + str(score) +
	"\nTop score: " + str(top_score))

func _on_TimerPoints_timeout():
	score+=1
	control_node.get_node("./LabelGameScore").set_text("Score: " + str(score) +
	"\nTop score: " + str(top_score))

func _on_Button_button_up():
	get_tree().paused = false
	emit_signal("reset")
	control_node.get_node("PopupDeath").set_visible(false)
	control_node.get_node("./LabelGameScore").set_visible(true)
	control_node.get_node("./LabelGameScore").set_text("Score: " + str(score) +
	"\nTop score: " + str(top_score))

func _on_Player_hit():
	$AudioHit.play()
	control_node.get_node("./LabelGameScore").set_visible(false)
	control_node.get_node("PopupDeath").set_visible(true)
	if score > top_score:
		top_score = score
	control_node.get_node("./PopupDeath/LabelScore").set_text("Score: " + str(score) +
	"\nTop score: " + str(top_score))
	score = 0
	get_tree().paused = true