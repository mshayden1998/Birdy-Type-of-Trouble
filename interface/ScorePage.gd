extends Control


func _ready():
	$ScoreInfo.set_text(str(Global.load_best_score()))


func _on_GoBackBtn_pressed():
	if get_tree().change_scene("res://interface/MainMenu.tscn") != OK:
		print("An unexpected error occured when trying to load MainMenu scene")
