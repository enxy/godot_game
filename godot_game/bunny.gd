extends KinematicBody2D

var velocity = Vector2()
var speed = 50
var first_movement = true
var BULLET = preload("res://bullet.tscn")
var bullet_speed = 250
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",self,"_on_timer_timeout") 

	add_child(timer)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	process_input()
	if first_movement:
		velocity.x += delta * speed

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		first_movement = false
		
func _on_timer_timeout():
	fire()
	self.timer.start()

func fire():
	var bullet = BULLET.instance()
	bullet.position = self.position
	bullet.add_collision_exception_with(self)
	get_parent().add_child(bullet)
	
func process_input():
	if Input.is_action_just_pressed("ui_select"):
		fire()