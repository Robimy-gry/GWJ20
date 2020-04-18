extends Position2D

var player_human_scene = preload("res://src/Actors/Player_Human.tscn")
var player_wasp_scene = preload("res://src/Actors/Player_Wasp.tscn")
var player_plant_scene = preload("res://src/Actors/Player_Plant.tscn")
var player_worm_scene = preload("res://src/Actors/Player_Worm.tscn")
var player

func _ready():
	instance_player()
	add_to_group("Player_Spawner")


func instance_player():
	
	if GlobalWorld.playerType == "Human":
		player = player_human_scene.instance()
	elif GlobalWorld.playerType == "Wasp":
		player = player_wasp_scene.instance()
	elif GlobalWorld.playerType == "Plant":
		player = player_plant_scene.instance()
	elif GlobalWorld.playerType == "Worm":
		player = player_worm_scene.instance()
	else:
		print("playerType not known: ", GlobalWorld.playerType)
		print("Please check: PlayerSpawner.gd -> instance_player()")
		player = player_human_scene.instance()
	add_child(player)

func set_coordinates_from_child() -> void:
	self.position = get_child(0).global_position
	
	
func get_player_instance():
	return player
