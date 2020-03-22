extends ViewportContainer

var size : Vector2

func _ready():
	connect("resized", self, "resizeViewport")
	size = get_size()
	$Viewport.set_size(size)
	pass

func resizeViewport():
	print("KEK")
	size = get_size()
	$Viewport.set_size(size)
