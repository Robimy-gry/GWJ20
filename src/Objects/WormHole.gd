tool
extends Area2D

export var next_worm_hole_name: String
var is_activated = false
var player: KinematicBody2D


func _ready() -> void:
	add_to_group("WormHoles")
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") and is_activated:
		teleport(player.get_parent())


func _get_configuration_warning() -> String:
		return "Name of the next worm hole can't be empty" if not next_worm_hole_name else ""

func teleport(body) -> void:
	var next_worm_hole = get_tree().get_root().find_node(next_worm_hole_name, true, false)
	if next_worm_hole != null:
		body.position = next_worm_hole.get_position()


func _on_WormHole_body_entered(body: Node) -> void:
	if body.is_in_group("Player") and GlobalWorld.playerType == "Worm":
		is_activated = true
		player = body


func _on_WormHole_body_exited(body: Node) -> void:
	if body.is_in_group("Player"):
		is_activated = false
