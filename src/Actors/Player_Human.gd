extends Actor
class_name Player

func _ready() -> void:
	add_to_group("Player")
	get_tree().call_group("Level", "set_camera_limits")
	

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("ui_up") and _velocity.y < 0.0
	var direction: = get_direction() 
	flip_sprite(direction)
	_velocity = calculate_move_velocity(_velocity,direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	if !is_on_floor():
		$AnimatedSprite.play("jump")
	elif (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) != 0:
		$AnimatedSprite.play("move")
	else:
		$AnimatedSprite.play("idle")


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() else 1.0
	)


func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func get_camera_instance():
	return $Camera2D

func _on_Area2D_body_entered(body: Node) -> void:
	killed_by(body)
