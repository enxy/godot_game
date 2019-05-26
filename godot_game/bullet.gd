extends RigidBody2D

const VELOCITY = Vector2(0, -300)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
    move(delta)
    removeWhenOffScreen()

func move(delta):
    global_position += VELOCITY * delta

func removeWhenOffScreen():
    if global_position.y < 0:
        queue_free()