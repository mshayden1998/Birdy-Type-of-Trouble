extends Control


func _ready():
	var score = 0
	# Set label text with best score
	$VBoxContainer/BestScore.set_text(str(Global.load_best_score()))
	$VBoxContainer/CurrentScore.set_text(str(score))


func _on_Restart_pressed():
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")
