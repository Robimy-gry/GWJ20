extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(300.0,500.0)
export var gravity: = 2000.0

var _velocity: = Vector2.ZERO
var freeze = false


func _physics_process(delta: float) -> void:
	if freeze:
		speed = Vector2.ZERO


func flip_sprite(dir):
		$AnimatedSprite.flip_h = true if dir.x < 0 else false 


func killed_by(body: KinematicBody2D) -> void:
	var groups_list = body.get_groups()
	for name in GlobalWorld.playerTypes:
		if body.is_in_group(name) and name != "Human":
			GlobalWorld.playerType = name
			self.freeze = true
			body.freeze = true
			var enemy_anim = body.get_node("AnimatedSprite")
			enemy_anim.play("attack")
			yield(enemy_anim, "animation_finished")
			get_tree().call_group("Quotes", "show_quote")
			body.die()
			die()
			break
	

func die():
	if self.is_in_group("Player"):
		get_tree().call_group("Player_Spawner", "set_coordinates_from_child")
		get_tree().call_group("Player_Spawner", "instance_player")
	queue_free()
