extends Control


func _ready() -> void:
	var score = 0
	# Set label text with best score
	$VBoxContainer/CurrentScore.set_text(str(score))


func _on_Restart_pressed() -> void:
	if get_tree().change_scene("res://Main.tscn") != OK:
		print("An unexpected error occured when trying to load Main scene")
