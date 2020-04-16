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
    if is_on_wall():
        dir.x = dir.x * -1
        $RayCast2D.position.x *= -1

    if $RayCast2D.is_colliding() == false:
        dir.x = dir.x * -1
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
    
    

func flip_sprite(dir):
    if dir.x < 0:
        $AnimatedSprite.flip_h = true 
    else: 
        $AnimatedSprite.flip_h = false
