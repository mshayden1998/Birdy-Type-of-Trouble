extends Control


func _ready() -> void:
	# Create new file config object
	var config : ConfigFile = ConfigFile.new()
	# Store values.
	config.set_value("Player1", "best_score", 0)
	# Save it to a file (overwrite if already exists).
	config.save("user://scores.cfg")


func _on_Play_pressed() -> void:
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")


func _on_ScoreBtn_pressed() -> void:
	if get_tree().change_scene("res://interface/ScorePage.tscn") != OK:
		print("An unexpected error occured when trying to load ScorePage scene")


func _on_AboutBtn_pressed() -> void:
	if get_tree().change_scene("res://interface/AboutPage.tscn") != OK:
		print("An unexpected error occured when trying to load AboutPage scene")


func _on_ExitBtn_pressed() -> void:
	get_tree().quit()
