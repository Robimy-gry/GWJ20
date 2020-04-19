extends Node

var playerTypes = ["Human", "Wasp", "Worm", "Plant"]
var playerType = "Human"
var secretFinded = false

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("reset"):
		get_tree().reload_current_scene()
		playerType = "Human"
