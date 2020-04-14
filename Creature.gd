extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
var speed = 50
const MAX_SPEED = 200
var jump_height = -450
var motion = Vector2()
var friction = false

func movement():
	#motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + speed, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - speed, -MAX_SPEED)
	else:
		friction = true

func jump():
	if Input.is_action_pressed("ui_select") or Input.is_action_pressed("ui_up"):
		motion.y = jump_height
	if friction == true:
		motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

	
