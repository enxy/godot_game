extends CanvasLayer

func _ready():
	pass
	
func hide_life(id):
	$AnimationPlayer.play("life " + str(id))
	
func reset_lifes():
	$AnimationPlayer.play("reset")

func game_over():
	$game_over/AnimationPlayer.play("Nowa animacja")