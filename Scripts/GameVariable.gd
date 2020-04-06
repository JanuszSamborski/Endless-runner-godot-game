extends Node

const PLAYER_MOVEMENT_SPEED : float = 15.0
const PLAYER_MAX_X : float = 10.0


const ENEMY_BASIC = "enemy_basic"
const ENEMY_ZIGZAG = "enemy_zigzag"
const SPAWN_PROBABILITY : Dictionary = {ENEMY_BASIC: 5, ENEMY_ZIGZAG: 1}
var SPAWN_ARRAY : Array
const SPAWN_Z : float = -200.0
const SPAWN_X_MAX : float = 10.0
const OBJECT_SPEED : float = 80.0
const ENEMY_ZIGZAG_FREQ : float = 10.0
const ENEMY_ZIGZAG_AMP : float = 24.0
const DESPAWN_Z : float = 10.0
const OBJECT_ENEMY = "EnemyContainer"
const OBJECT_COIN = "CoinContainer"
const COIN_PROBABILITY : int = 5
const COIN_ROTATION : float = 5.0
const COIN_POINTS : int = 10

func _ready():
	for key in SPAWN_PROBABILITY:
		for _value in range(0, SPAWN_PROBABILITY[key], 1):
			 SPAWN_ARRAY.append(key)

