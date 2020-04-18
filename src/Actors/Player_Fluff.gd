extends Actor


func _ready() -> void:
	add_to_group("Player")
	self.speed.x = 30
	self.speed.y = -25
	self.gravity = 5
	_velocity.y = self.speed.y
	self.position.y += 16

func _physics_process(delta: float) -> void:
	var direction: = get_direction() 
	flip_sprite(direction)
	_velocity = calculate_move_velocity(_velocity,direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	if $RayCast2D.is_colliding():
		die()


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0
	)


func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	return out


func _on_Area2D_body_entered(body: Node) -> void:
	killed_by(body)
	
func get_camera_instance():
	return $Camera2D
