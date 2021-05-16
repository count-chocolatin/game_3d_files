extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 5
const JUMPYFORSE = 50
const GRAVITY = -3
const ROTSP = 7

func _physics_process(delta):
	if Input.is_action_pressed("derecha") and Input.is_action_pressed("isquierda"):
		velocity.x = 0
	elif Input.is_action_pressed("derecha"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTSP))
	elif Input.is_action_pressed("isquierda"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTSP))
	
	else:	
		velocity.x = lerp(velocity.x,0,0.1)
		
	if Input.is_action_pressed("adelante") and Input.is_action_pressed("atras"):
		velocity.z = 0
	elif Input.is_action_pressed("adelante"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTSP))
	elif Input.is_action_pressed("atras"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTSP))
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_released("saltar") and is_on_floor():
		velocity.y = JUMPYFORSE
		
	velocity = move_and_slide(velocity,Vector3.UP)



func _on_enemyg1_body_entered(body):
	if body.name == "manuel":
		get_tree().change_scene("res://Asest/game_over.tscn")


func _on_coin_body_entered(body):
	pass # Replace with function body.
