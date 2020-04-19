extends StaticBody2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene
var _canTeleport = false

func _physics_process(delta: float) -> void:
	if _canTeleport and Input.is_action_just_pressed("ui_down"):
		teleport()


func _get_configuration_warning() -> String:
		return "The next scene property can't be empty" if not next_scene else ""

func teleport() -> void:
	get_tree().change_scene_to(next_scene)
	GlobalWorld.playerType = "Human"



func _on_Area2D_body_entered(body: Node)-> void:
	if body.get_class() != 'StaticBody2D':
		_canTeleport = true

func _on_Area2D_body_exited(body):
	if body.get_class() != 'StaticBody2D':
		_canTeleport = false
