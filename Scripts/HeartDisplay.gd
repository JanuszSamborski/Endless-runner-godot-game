extends HBoxContainer
var heart_sprite : Resource

func _init():
	heart_sprite = load("res://Scenes/HeartSprite.tscn")
	for i in range(0, GameVariable.PLAYER_LIVES_MAX):
		var inst = heart_sprite.instance()
		add_child(inst)
		
	
func update_display():
	for i in range(0,GameVariable.PLAYER_LIVES):
		get_child(i).set_visible(true)
	for i in range(GameVariable.PLAYER_LIVES, GameVariable.PLAYER_LIVES_MAX):
		get_child(i).set_visible(false)
