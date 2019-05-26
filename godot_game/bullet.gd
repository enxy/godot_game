extends RigidBody2D

const velocity = Vector2(0, -300)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_collision_exception_with(get_node("/root/main/floor"))
	linear_velocity.y = -200
	
func hit():
	pass

func _process(delta):
	
#	var collision_info = move_and_collide(velocity * delta)
	var colliding_bodies = get_colliding_bodies()
	if colliding_bodies:
		if colliding_bodies[0] is Player:
			queue_free()


	removeWhenOffScreen()

func move(delta):
	global_position += velocity * delta

func removeWhenOffScreen():
	if global_position.y < 0:
		queue_free()
		
func remove():
	queue_free()