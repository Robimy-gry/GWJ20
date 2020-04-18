extends Actor

var hasFired = false
var player_fluff_scene = preload("res://src/Actors/Player_Fluff.tscn")


func _ready() -> void:
	add_to_group("Player")
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up") and hasFired != true:
		fire_fluff()
		hasFired = true
		
	_velocity = calculate_move_velocity(_velocity)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func fire_fluff():
	$Camera2D.queue_free()
	var player = player_fluff_scene.instance()
	get_parent().add_child(player)
	remove_from_group("Player")
	$FluffTimer.start()


func calculate_move_velocity(
		linear_velocity: Vector2
	) -> Vector2:
	var out: = linear_velocity
	out.x = 0
	out.y += gravity * get_physics_process_delta_time()

	return out
	


func _on_Area2D_body_entered(body: Node) -> void:
	killed_by(body)


func _on_FluffTimer_timeout() -> void:
	die()
	
func get_camera_instance():
	return $Camera2D
