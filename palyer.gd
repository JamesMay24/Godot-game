extends KinematicBody2D
var velocity = Vector2()
const speed = 180
const gravity = 30
const jump = -700
var money = 0
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.play('Walk')
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed 
		$AnimatedSprite.play('Walk')
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play('Idle')
	if not is_on_floor():
		$AnimatedSprite.play('Jump')
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
	velocity.y = velocity.y + gravity
	velocity= move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
	if money == 20:
		get_tree().change_scene("res://Win.tscn")
func die ():
	get_tree().reload_current_scene()
	
func collect_coin (value):
	money += value






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
