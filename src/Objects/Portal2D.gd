tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene


func _get_configuration_warning() -> String:
		return "The next scene property can't be empty" if not next_scene else ""

func teleport() -> void:
	anim_player.play("fade-in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _on_Portal2D_body_entered(body: Node) -> void:
	teleport()
