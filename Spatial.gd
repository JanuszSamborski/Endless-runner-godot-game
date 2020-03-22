extends Spatial


func _ready():
	pass
	
func _process(delta):
	$MeshInstance.rotate_y(delta)
