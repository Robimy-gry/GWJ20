extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !GlobalWorld.secretFinded:
		$ColorRect/EggHunt.hide()
	else:
		$ColorRect/SecretLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://src/Objects/TitleScene.tscn")
