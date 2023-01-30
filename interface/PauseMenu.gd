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
