extends Control

var current_quote


func _ready():
	add_to_group("Quotes")
	select_quote()
	
func _physics_process(delta):
	next_scene()

func select_quote():
	var quotes = get_from_json("quotes.json")
	randomize()
	current_quote = quotes[randi() % quotes.size()]
	$VBoxContainer/Quote.text = "\"" + current_quote.quote + "\""
	$VBoxContainer/Author.text = current_quote.author


func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func next_scene():
	if Input.is_action_just_pressed("ui_select"):
		queue_free()
