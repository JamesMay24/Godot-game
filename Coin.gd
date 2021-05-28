extends Area2D

export var value = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()
