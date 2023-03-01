extends Control



func _ready():
	$Panel.visible = false
	$ResumeBtn.visible = false
	$ExitBtn.visible = false
	$RestartBtn.visible = false
	$CurrentScoreInfo.visible = false


func _input(_event):
	if Input.is_action_just_pressed("ui_pause"):
		pause_toggle()


func _on_Pause_pressed():
	pause_toggle()


func _on_Resume_pressed():
	pause_toggle()


func pause_toggle():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$Panel.visible = new_pause_state
	$ResumeBtn.visible = new_pause_state
	$ExitBtn.visible = new_pause_state
	$RestartBtn.visible = new_pause_state
	$CurrentScoreInfo.visible = new_pause_state


func _on_ExitBtn_pressed():
	pause_toggle()
	if get_tree().change_scene("res://interface/MainMenu.tscn") != OK:
		print("Falha ao carregar a cena MainMenu.")


func _on_RestartBtn_pressed():
	pause_toggle()
	get_tree().reload_current_scene()
