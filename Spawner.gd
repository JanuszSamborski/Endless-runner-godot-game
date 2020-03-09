extends Node

const enemy_basic = preload("res://EnemyBasic.tscn")
const enemy_zigzag = preload("res://EnemyZigzag.tscn")

var node_obsticles : Node
var variable_node : Node

func _ready():
	connect("player_died", self, "reset")
	variable_node = get_node("/root/GameVariable")
	node_obsticles = get_node("Obsticles")
	spawn()
	pass

var interval : float = 1

var time : float = 0
func _process(delta):
	time+=delta
	if time>variable_node.enemy_spawn_rate:
		time-=variable_node.enemy_spawn_rate
		spawn()
		for n in node_obsticles.get_children():
			if n.get_translation_z()>variable_node.enemy_despawn_position:
				n.queue_free()
	pass

func reset():
	for n in node_obsticles.get_children():
		node_obsticles.remove_child(n)
		n.queue_free()
	self.spawn()

var enemy
func spawn():
	randomize()
	var pos = rand_range(-variable_node.enemy_area,variable_node.enemy_area)

	if round(fmod(pos, 5)) == 0:
		enemy = enemy_zigzag.instance()
	else:
		enemy = enemy_basic.instance()
	
	node_obsticles.add_child(enemy)
	enemy.set_translation(variable_node.get_enemy_default_position(pos))
	pass
	
