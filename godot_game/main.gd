extends Node2D

var crate_object = load("res://crate.tscn")
var timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# delta czas ktory uplyna od poprzedniej klatki (0.01s)
func _process(delta):
	timer+=delta
	
	if timer > 1:
		timer = 0.0
		var new_object = crate_object.instance()
		var i = randi()%500
		new_object.position = Vector2(i, -100)
		$crates.add_child(new_object)
