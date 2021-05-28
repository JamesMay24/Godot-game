extends Control

onready var rich = get_node("HowRich")
func set_score_text (score):
	rich.text = str(score)
