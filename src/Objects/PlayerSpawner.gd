extends Position2D

var player_human_scene = preload("res://src/Actors/Player_Human.tscn")
var player_wasp_scene = preload("res://src/Actors/Player_Wasp.tscn")


func _ready():
    instance_player()
    add_to_group("Player_Spawner")


func instance_player():
    var player
    if GlobalWorld.playerType == "Human":
        player = player_human_scene.instance()
    elif GlobalWorld.playerType == "Wasp":
        player = player_wasp_scene.instance()
    else:
        print("playerType not known: ", GlobalWorld.playerType)
        print("Please check: PlayerSpawner.gd -> instance_player()")
        player = player_human_scene.instance()
    add_child(player)

func get_coordinates() -> void:
    self.position = get_child(0).global_position
    
