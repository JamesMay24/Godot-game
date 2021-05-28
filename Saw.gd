extends Area2D

export var speed : int = 100
export var moveDist : int = 100
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist
func move_to (current, to, step):
	var new = current
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	return new
func _physics_process (delta):
	position.x = move_to(position.x, targetX, speed * delta)
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
func _on_Saw_body_entered(body):
	if body.name == "Player":
		body.die()
