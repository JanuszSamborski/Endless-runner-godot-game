extends Area

var score_node : Node
var variable_node : Node
var spawner_node : Node
signal player_died
signal powerup_collected

func _ready():
	score_node = get_node("/root/Level/Score")
	variable_node = get_node("/root/GameVariable")
	spawner_node = get_node("/root/Level/Spawner")
	
	if connect("player_died", self, "reset")!=0:
		print("player_died signal connect failed in Player node")
	if connect("powerup_collected", score_node, "add_points")!=0:
		print("powerup_collected signal connect failed in Player node")
	pass


func reset():
	set_translation(variable_node.player_default_position)

func _process(_delta):
	if Input.is_key_pressed(KEY_LEFT):
		if get_translation()[0]>-variable_node.player_area:
			translate(Vector3.LEFT*variable_node.player_movement_speed)
	if Input.is_key_pressed(KEY_RIGHT):
		if get_translation()[0]<variable_node.player_area:
			translate(Vector3.RIGHT*variable_node.player_movement_speed)
		
	if get_overlapping_areas().size()>0: # should be replaced with area_entered - signal not working
		for area in get_overlapping_areas():
			if area.get_parent().get_name() == variable_node.OBSTICLES:
				emit_signal("player_died")
			elif area.get_parent().get_name() == variable_node.POWERUP:
				area.queue_free()
				emit_signal("powerup_collected")
		
	pass
