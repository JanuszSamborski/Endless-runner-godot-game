extends Node

var player_area : float = 40
var player_movement_speed : float = 0.5
var player_default_position : Vector3 = Vector3(0, 2, 0)
signal player_died
var player_score : float = 0
var player_max_score : float = 0

var enemy_area : float = 40
var enemy_spawn_rate : float = 0.1
var enemy_despawn_position : float = 40

var enemy_basic_speed : float = 90

var enemy_zigzag_z_speed : float = 2
var enemy_zigzag_sin_mult : float = 5

func get_enemy_default_position(position):
	return Vector3(position, 2, -60)
