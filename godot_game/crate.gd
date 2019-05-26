extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _physics_process(delta):
#	var bodies = get_colliding_bodies()
#	if bodies.size() > 0:
#
#		for shape in get_children():
#			CollisionShape2D.

func _on_crate_body_shape_entered(body_id, body, body_shape, local_shape):
	var bodies = get_colliding_bodies()
	var floor_node = get_node("/root/main/floor")
	if floor_node in bodies:
		queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
	
#set_continuous_collision_detection_mode(CCD_MODE_DISABLED)

	#get_child(local_shape).queue_free()
