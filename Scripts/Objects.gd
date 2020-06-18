extends Node
var enemy_zigzag : Resource
var enemy_basic : Resource
var coin : Resource
var heart : Resource
var shield : Resource
var redDiamond: Resource
var asteroid: Resource
var ball: Resource
var rng : RandomNumberGenerator
var inst : Node

func _ready():
	rng = RandomNumberGenerator.new()
	enemy_zigzag = load("res://Scenes/EnemyZigzag.tscn")
	enemy_basic = load("res://Scenes/EnemyBasic.tscn")
	coin = load("res://Scenes/Coin.tscn")
	heart = load("res://Scenes/Heart.tscn")
	shield = load("res://Scenes/Shield.tscn")
	redDiamond = load("res://Scenes/Diamond.tscn")
	asteroid = load("res://Scenes/Asteroid.tscn")
	ball = load("res://Scenes/Ball.tscn")
	pass

func _spawn_enemy():
	rng.randomize()
	var random = rng.randi_range(0,GameVariable.SPAWN_ARRAY_ENEMY.size()-1)
	match GameVariable.SPAWN_ARRAY_ENEMY[random]:
		GameVariable.ENEMY_BASIC:
			inst = enemy_basic.instance()
			$EnemyContainer.add_child(inst)
		GameVariable.ENEMY_ZIGZAG:
			inst = enemy_zigzag.instance()
			$EnemyContainer.add_child(inst)
		GameVariable.ASTEROID:
			inst = asteroid.instance()
			$AsteroidContainer.add_child(inst)
		GameVariable.OBJECT_NOTHING:
			pass
			

func _spawn_random():
	rng.randomize()
	var random = rng.randi_range(0,GameVariable.SPAWN_ARRAY_OTHER.size()-1)
	match GameVariable.SPAWN_ARRAY_OTHER[random]:
		GameVariable.COIN:
			inst = coin.instance()
			$CoinContainer.add_child(inst)
		GameVariable.HEART:
			if GameVariable.PLAYER_LIVES<GameVariable.PLAYER_LIVES_MAX:
				if $HeartContainer.get_child_count()==0:
					inst = heart.instance()
					$HeartContainer.add_child(inst)
			else:
				_spawn_random()
		GameVariable.DIAMOND:
			inst = redDiamond.instance()
			$DiamondContainer.add_child(inst)
		GameVariable.BALL:
			inst = ball.instance()
			$BallContainer.add_child(inst)
		GameVariable.SHIELD:
			inst = shield.instance()
			$ShieldContainer.add_child(inst)
		GameVariable.OBJECT_NOTHING:
			pass

func _on_TimerEnemy_timeout():
	$TimerOther.start($TimerEnemy.get_wait_time()/2.0)
	_spawn_enemy()


func _on_Game_reset():
	for child in $CoinContainer.get_children():
		child.queue_free()
	for child in $DiamondContainer.get_children():
		child.queue_free()
	for child in $EnemyContainer.get_children():
		child.queue_free()
	for child in $HeartContainer.get_children():
		child.queue_free()
	for child in $ShieldContainer.get_children():
		child.queue_free()
	for child in $AsteroidContainer.get_children():
		child.queue_free()
	for child in $BallContainer.get_children():
		child.queue_free()



func _on_TimerOther_timeout():
	_spawn_random()
	pass
