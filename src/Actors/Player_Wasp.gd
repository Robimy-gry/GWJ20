extends Actor

func _ready() -> void:
    self.speed.y = 300


func _physics_process(delta: float) -> void:
    var direction: = get_direction() 
    flip_sprite(direction)
    _velocity = calculate_move_velocity(_velocity,direction, speed)
    _velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction() -> Vector2:
    return Vector2(
        Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
        Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    )


func calculate_move_velocity(
        linear_velocity: Vector2,
        direction: Vector2,
        speed: Vector2
    ) -> Vector2:
    var out: = linear_velocity
    out = speed * direction
    return out

func flip_sprite(direction):
    
