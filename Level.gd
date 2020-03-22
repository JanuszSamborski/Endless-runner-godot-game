extends Spatial

var node_player : Node

func _ready():
	node_player = get_node("Player")
	if node_player.connect("player_died", self, "openPopup")!=OK:
		print("player_died signal connect failed in Level node")
	$Popup/Button.connect("button_down", node_player, "reset")
	$Popup/Button.connect("button_down", self, "closePopup")
	pass

func openPopup():
	$Popup.show()
	
func closePopup():
	print("Popup button down")
	if $Popup.is_visible():
		$Popup.hide()
