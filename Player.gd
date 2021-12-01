extends KinematicBody
class_name Player


var speed = 12
var gravity = Vector3.DOWN * 50
var jump = Vector3.UP * 16

var vel = Vector3()
var can_jump = false


func get_input():
	vel = Vector3(0, vel.y, 0)
	
	var dir = Vector3()
	if Input.is_action_pressed("left"):
		dir -= transform.basis.x
	if Input.is_action_pressed("right"):
		dir += transform.basis.x
	if Input.is_action_pressed("up"):
		dir -= transform.basis.z
	if Input.is_action_pressed("down"):
		dir += transform.basis.z
		
	vel += dir * speed
	
	can_jump = Input.is_action_just_pressed("jump")
	

func _physics_process(delta):
	vel += gravity * delta
	get_input()
	
	vel = move_and_slide(vel, Vector3.UP)
	
	if can_jump and is_on_floor():
		vel += jump
