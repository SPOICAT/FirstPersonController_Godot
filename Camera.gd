extends Camera

var sense = 0.25

func _input(event):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		get_parent().rotation_degrees.y -= event.relative.x * sense
		rotation_degrees.x -= event.relative.y * sense
