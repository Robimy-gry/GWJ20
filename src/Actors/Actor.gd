extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(300.0,500.0)
export var gravity: = 2000.0

var _velocity: = Vector2.ZERO


func flip_sprite(dir):
        $AnimatedSprite.flip_h = true if dir.x < 0 else false 

func killed_by(body) -> void:
    var groups_list = body.get_groups()
        
    if body.is_in_group("Enemy"):
        print("ENEMY!")
    
    for name in GlobalWorld.playerTypes:
        if body.is_in_group(name) and name != "Human":
            GlobalWorld.playerType = name
            die()
            break
    

func die():
    queue_free()
    if self.is_in_group("Player"):
        get_tree().call_group("Player_Spawner", "instance_player")
