extends Node
var enemy_zigzag : Resource
var enemy_basic : Resource
var coin : Resource
var rng : RandomNumberGenerator
var inst : Node


func _ready():
	rng = RandomNumberGenerator.new()
	enemy_zigzag = load("res://Scenes/EnemyZigzag.tscn")
	enemy_basic = load("res://Scenes/EnemyBasic.tscn")
	coin = load("res://Scenes/Coin.tscn")
	pass

func _spawn_enemy():
	rng.randomize()
	var random = rng.randi_range(0,GameVariable.SPAWN_ARRAY.size()-1)
	match GameVariable.SPAWN_ARRAY[random]:
		GameVariable.ENEMY_BASIC:
			inst = enemy_basic.instance()
			$EnemyContainer.add_child(inst)
		GameVariable.ENEMY_ZIGZAG:
			inst = enemy_zigzag.instance()
			$EnemyContainer.add_child(inst)

func _spawn_coin():
	rng.randomize()
	var random = rng.randi_range(0,GameVariable.COIN_PROBABILITY)
	if random == 0:
		inst = coin.instance()
		$CoinContainer.add_child(inst)


func _on_TimerEnemy_timeout():
	_spawn_enemy()


func _on_TimerCoin_timeout():
	_spawn_coin()


func _on_Game_reset():
	for child in $CoinContainer.get_children():
		child.queue_free()
	for child in $EnemyContainer.get_children():
		child.queue_free()

