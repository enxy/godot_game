extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var start_position = Vector2(400, 300);

onready var gui = get_node("../GUI")
onready var scores_label = get_node("../GUI/Scores")
var lifes = 3
var scores = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(400, 300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	process_input()
#	position += velocity
	apply_central_impulse(velocity)
	#if position.x> get_viewport().size.x:
	#	position = start_position
		
func _integrate_forces(state):		
	if position.y > get_viewport().size.y:

		if lifes>0:
			gui.hide_life(lifes)
		else:
			gui.reset_lifes()
			gui.game_over()
			lifes = 3
		print(scores_label.set_text(str(scores)))
		print(scores_label.get_text())
		lifes = lifes - 1		
		scores += 1
		
		state.transform = Transform2D(0, start_position)
		state.linear_velocity = Vector2()
		
func create_bullet():
	pass

func process_input():
	if Input.is_action_pressed("ui_select"):
		create_bullet()

	velocity = Vector2( 0, 0)

	if Input.is_action_pressed("ui_down"):
		velocity.y += 100
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 3000
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 100
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
	