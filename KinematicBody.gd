extends KinematicBody

func _ready():
	set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_X, true)
	set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Y, true)
	set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Z, true)
	set_axis_lock(PhysicsServer.BODY_AXIS_ANGULAR_X, true)
	set_axis_lock(PhysicsServer.BODY_AXIS_ANGULAR_Y, true)
	set_axis_lock(PhysicsServer.BODY_AXIS_ANGULAR_Z, true)
	pass



func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		move_and_collide(Vector3.LEFT*15*delta, false, true, false)
	if Input.is_key_pressed(KEY_RIGHT):
		move_and_collide(Vector3.RIGHT*15*delta, false, true, false)
		
	if get_slide_count()>0:
		print(get_slide_count())
	pass

