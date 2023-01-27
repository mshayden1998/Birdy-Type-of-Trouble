extends Control

onready var lab_score_info = $VBoxContainer/ScoreInfo


func _ready():
	var best_score = load_best_score()
	# Set label text with best score
	lab_score_info.set_text(tr("LAB_BEST_SCORE") + str(best_score))


func _on_Restart_pressed():
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")


func load_best_score():
	var save_file = File.new()
	save_file.open("user://save_game.dat", File.READ)
	var best_score = save_file.get_as_text()
	save_file.close()
	return best_score
