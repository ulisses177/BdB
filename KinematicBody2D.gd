extends KinematicBody2D

var motion = Vector2 ()
var direction = "Right"
var new_direction =  "Right"
var sprite_scale = Vector2 (0.5,0.5)
var sprite_offset =  -64
#func FlipSprite(right):
#	if right :
#		$AnimatedSprite.set_scale(1,1)
#	else: 
#		$AnimatedSprite.set_scale(-1,1

func _process(delta):
	motion.x = 0 
	if motion.y < 500 :
		motion.y += 10
	if  Input.is_action_pressed("ui_right"):
		motion.x = motion.x+256
	
	if Input.is_action_pressed("ui_left"):
		motion.x = motion.x-256
	
	if is_on_floor() : 
		print ("on floor")
		if Input.is_action_pressed("ui_up"): 
			motion.y = -400
		
	
	
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
			$AnimatedSprite.offset.x = 96
		if direction == "Left":
			$AnimatedSprite.set_scale(Vector2(-0.5,0.5))
			$AnimatedSprite.offset.x = 32
			
	
	move_and_slide(motion)
	pass
	
	

