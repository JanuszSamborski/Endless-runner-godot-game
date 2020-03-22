extends Node

const enemy_basic = preload("res://EnemyBasic.tscn")
const enemy_zigzag = preload("res://EnemyZigzag.tscn")
const powerup_coin = preload("res://PowerupCoin.tscn")

var node_obsticles : Node
var node_powerup : Node
var variable_node : Node
var player_node : Node

func _ready():
	variable_node = get_node("/root/GameVariable")
	node_obsticles = get_node("Obsticles")
	node_powerup = get_node("Powerup")
	player_node = get_node("/root/Level/Player")
	if player_node.connect("player_reset", self, "reset")!= OK:
		print("player_died signal connect failed in Spawner node")
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

var instance
func spawn():
	randomize()
	
	var pos = rand_range(-variable_node.enemy_area,variable_node.enemy_area)
	var rand = int(pos)
	
	#todo: replace this ugliness with modulos
	if rand%99 == 0:
		instance = enemy_zigzag.instance()
		
		node_obsticles.add_child(instance)
	elif rand%2 == 0:
		instance = powerup_coin.instance()
		node_powerup.add_child(instance)
	else:
		instance = enemy_basic.instance()
		node_obsticles.add_child(instance)
	

	instance.set_translation(variable_node.get_enemy_default_position(pos))
	pass
	
