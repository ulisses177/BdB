extends KinematicBody2D

var motion = Vector2 ()
var direction = "Right"
var new_direction =  "Right"
#func FlipSprite(right):
#	if right :
#		$AnimatedSprite.set_scale(1,1)
#	else: 
#		$AnimatedSprite.set_scale(-1,1)



func _process(delta):
	if  Input.is_action_pressed("ui_right"):
		motion.x = 256
	else:
		if Input.is_action_pressed("ui_left"):
			motion.x = -256
		else: 
			motion.x = 0 
	
	if motion.x == 0:
		$AnimatedSprite.play("Idle")
	if motion.x > 0:
		$AnimatedSprite.play("Run")
		direction = "Right"
	if motion.x < 0:
		$AnimatedSprite.play("Run")
		direction = "Left"
	if direction != new_direction :
		new_direction = direction
		if direction == "Right":
			$AnimatedSprite.set_scale(Vector2(0.5,0.5))
		if direction == "Left":
			$AnimatedSprite.set_scale(Vector2(-0.5,0.5))
	
	move_and_slide(motion)
	pass
	
	

