extends Node

const PLAYER_MOVEMENT_SPEED : float = 15.0
const PLAYER_MAX_X : float = 10.0
const PLAYER_LIVES_MAX : int = 3
var PLAYER_LIVES : int = PLAYER_LIVES_MAX
var PLAYER_HAS_SHIELD : bool = false

const ENEMY_BASIC = "enemy_basic"
const ENEMY_ZIGZAG = "enemy_zigzag"
const SPAWN_PROBABILITY_ENEMY : Dictionary = {ENEMY_BASIC: 5, ENEMY_ZIGZAG: 1}
var SPAWN_ARRAY_ENEMY : Array
const COIN = "coin"
const OBJECT_NOTHING = "nothing"
const HEART = "heart"
const DIAMOND = "diamond"
const SHIELD = "shield"
const SPAWN_PROBABILITY_OTHER : Dictionary = {COIN: 7, HEART: 2, SHIELD: 1, DIAMOND: 2, OBJECT_NOTHING : 3}
var SPAWN_ARRAY_OTHER : Array
const SPAWN_Z : float = -200.0
const SPAWN_X_MAX : float = 10.0
const START_OBJECT_SPEED : float = 60.0
var OBJECT_SPEED : float = 60.0
const OBJECT_SPEED_INCREASE = 5.0
const ENEMY_ZIGZAG_FREQ : float = 10.0
const ENEMY_ZIGZAG_AMP : float = 24.0
const DESPAWN_Z : float = 10.0
const OBJECT_ENEMY = "EnemyContainer"
const OBJECT_COIN = "CoinContainer"
const OBJECT_DIAMOND = "DiamondContainer"
const COIN_PROBABILITY : int = 5
const DIAMOND_ROTATION : float = 4.0
const COIN_ROTATION : float = 5.0
const COIN_POINTS : int = 10
const DIAMOND_POINTS: int = 20
const OBJECT_HEART = "HeartContainer"
const OBJECT_SHIELD = "ShieldContainer"
const HEART_ROTATION : float = 6.0
const HEART_PROBABILITY : int = 2
const SHIELD_ROTATION_SPEED : float = 8.0
const SHIELD_DURATION : float = 8.0

func _ready():
	for key in SPAWN_PROBABILITY_ENEMY:
		for _value in range(0, SPAWN_PROBABILITY_ENEMY[key], 1):
			 SPAWN_ARRAY_ENEMY.append(key)
	for key in SPAWN_PROBABILITY_OTHER:
		for _value in range(0, SPAWN_PROBABILITY_OTHER[key], 1):
			 SPAWN_ARRAY_OTHER.append(key)

