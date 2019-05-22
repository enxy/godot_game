extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var gravity = Vector2( 0, 50 )
var bullet_object = load("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(200, 300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_input()
#	position += velocity
	velocity = move_and_slide(velocity, Vector2(0, -1))
	velocity.x *= 0.9

func create_bullet():
	var new_bullet = bullet_object.instance()
	new_bullet.position = $Position2D.position
	add_child(new_bullet)

func process_input():
	if Input.is_action_pressed("ui_select"):
		create_bullet()
		
	if ! is_on_floor():
		velocity += gravity
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 60
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 70
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 70
	if Input.is_action_pressed("ui_right"):
		velocity.x += 70
		