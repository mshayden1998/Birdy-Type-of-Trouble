extends Control


func _ready():
	pass


func _on_Player_scored(current_score):
	$CurrentScore.text = String(current_score)
