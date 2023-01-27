extends Control


func _ready():
	var best_score = 0
	var score = 0
	# Set label text with best score
	$Panel/VBoxContainer/BestScore.set_text(str(best_score))
	$Panel/VBoxContainer/Score.set_text(str(score))


func _on_Restart_pressed():
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")
