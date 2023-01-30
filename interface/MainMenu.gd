extends Control


func _ready():
	# Create new file config object
	var config = ConfigFile.new()
	# Store values.
	config.set_value("Player1", "best_score", 0)
	# Save it to a file (overwrite if already exists).
	config.save("user://scores.cfg")


func _on_Play_pressed() -> void:
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")


func _on_ScoreBtn_pressed():
	if get_tree().change_scene("res://interface/ScorePage.tscn") != OK:
		print("An unexpected error occured when trying to load ScorePage scene")


func _on_AboutBtn_pressed():
	if get_tree().change_scene("res://interface/AboutPage.tscn") != OK:
		print("An unexpected error occured when trying to load AboutPage scene")
