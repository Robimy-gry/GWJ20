extends Actor


func _ready() -> void:
	add_to_group("Plant")
	
func _physics_process(delta: float) -> void:
		
	_velocity = calculate_move_velocity(_velocity)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func calculate_move_velocity(
		linear_velocity: Vector2
	) -> Vector2:
	var out: = linear_velocity
	out.x = 0
	out.y += gravity * get_physics_process_delta_time()

	return out
	
