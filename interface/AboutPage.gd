extends Control


func _on_GoBackBtn_pressed() -> void:
	if get_tree().change_scene("res://interface/MainMenu.tscn") != OK:
		print("An unexpected error occured when trying to load MainMenu scene")
