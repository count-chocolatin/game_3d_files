extends Area

signal coin_colected

func _ready():
	pass
	
func _physics_process(delta):
	rotate_y(deg2rad(3))


func _on_coin_body_entered(body):
	if body.name == "manuel":
		$AnimationPlayer.play("coin")
		$Timer.start()
		


func _on_Timer_timeout():
	queue_free()
	emit_signal("coin_colected")
