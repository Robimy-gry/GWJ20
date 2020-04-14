extends KinematicBody2D

var creatureClass = load("res://Creature.gd")
var creature = creatureClass.new()

func _physics_process(delta):
    move_and_slide(creature.motion, creature.UP)
    creature.movement()
    if is_on_floor():
        creature.jump()
    
    

    
