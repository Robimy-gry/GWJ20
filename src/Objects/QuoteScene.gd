extends CanvasLayer

var current_quote
onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready():
	add_to_group("Quotes")
	#show_quote()
	#select_quote()
	
func _physics_process(delta):
	next_scene()

func select_quote():
	var quotes = get_from_json("quotes.json")
	randomize()
	current_quote = quotes[randi() % quotes.size()]
	$ColorRect/VBoxContainer/Quote.text = "\"" + current_quote.quote + "\""
	$ColorRect/VBoxContainer/Author.text = current_quote.author


func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data


func show_quote():
	get_tree().paused = true
	select_quote()
	anim_player.play("fade-in")
	yield(anim_player, "animation_finished")


func next_scene():
	if Input.is_action_just_pressed("ui_select"):
		anim_player.play("Start")
		get_tree().paused = false
