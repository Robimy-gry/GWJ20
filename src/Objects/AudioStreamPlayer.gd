extends AudioStreamPlayer

var humanSFX = "res://Assets/SFX/rolnik.ogg"
var waspSFX = "res://Assets/SFX/osa_vibrato.ogg"
var wormSFX = "res://Assets/SFX/plant.ogg"
var plantSFX = "res://Assets/SFX/robak.ogg"

func _ready() -> void:
	add_to_group("AudiostreamPlayer")

func change_music():
	if GlobalWorld.playerType == "Human":
		self.stream = load(humanSFX)
		self.play()
	elif GlobalWorld.playerType == "Wasp":
		self.stream = load(waspSFX)
		self.play()
	elif GlobalWorld.playerType == "Worm":
		self.stream = load(wormSFX)
		self.play()
	elif GlobalWorld.playerType == "Plant":
		self.stream = load(plantSFX)
		self.play()	
