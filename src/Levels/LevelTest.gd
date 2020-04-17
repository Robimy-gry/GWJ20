extends Node2D

func _ready():
    set_camera_limits()

func set_camera_limits():
    var map_limits = $TileMap.get_used_rect()
    var map_cellsize = $TileMap.cell_size
    var player: Player = $PlayerSpawner.get_player_instance()
    player.get_camera_instance().limit_left = map_limits.position.x * map_cellsize.x
    player.get_camera_instance().limit_right = map_limits.end.x * map_cellsize.x
    player.get_camera_instance().limit_top = map_limits.position.y * map_cellsize.y
    player.get_camera_instance().limit_bottom = map_limits.end.y * map_cellsize.y

