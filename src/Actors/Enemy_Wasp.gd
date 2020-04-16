extends Actor

var direction: = Vector2(1,0)

func _ready() -> void:
    self.speed.y = 300


func _physics_process(delta: float) -> void:
    self.direction = get_direction(self.direction) 
    flip_sprite(direction)
    _velocity = calculate_move_velocity(_velocity, direction, speed)
    _velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction(dir) -> Vector2:
    if is_on_wall() or $RayCast2D.is_colliding() == false:
        dir.x = -dir.x
        $RayCast2D.position.x *= -1
     
    return dir


func calculate_move_velocity(
        linear_velocity: Vector2,
        dir: Vector2,
        speed: Vector2
    ) -> Vector2:
       
        
    var out: = linear_velocity
    out.x = speed.x * dir.x
    out.y += gravity * get_physics_process_delta_time()
    return out   
