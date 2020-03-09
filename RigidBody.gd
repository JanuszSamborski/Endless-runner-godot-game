extends Area

var score_node : Node
var variable_node : Node
var spawner_node : Node
signal player_died

func _ready():
	connect("player_died", self, "reset")
	score_node = get_node("/root/Level/Score")
	variable_node = get_node("/root/GameVariable")
	spawner_node = get_node("/root/Level/Spawner")
	pass


func reset():
	spawner_node.reset()
	set_translation(variable_node.player_default_position)
	score_node.player_reset()

func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		if get_translation()[0]>-variable_node.player_area:
			translate(Vector3.LEFT*variable_node.player_movement_speed)
	if Input.is_key_pressed(KEY_RIGHT):
		if get_translation()[0]<variable_node.player_area:
			translate(Vector3.RIGHT*variable_node.player_movement_speed)
		
	if get_overlapping_areas().size()>0:
		emit_signal("player_died")
	pass
