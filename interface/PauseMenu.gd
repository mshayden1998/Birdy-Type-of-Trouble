extends Control

onready var resume_btn: Button = $"%ResumeBtn"
onready var exit_btn: Button = $"%ExitBtn"
onready var restart_btn: Button = $"%RestartBtn"


func _ready():
	$Panel.visible = false
	resume_btn.visible = false
	exit_btn.visible = false
	restart_btn.visible = false
	$CurrentScoreInfo.visible = false


func _gui_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_pause"):
		pause_toggle()


func _on_Pause_pressed() -> void:
	pause_toggle()


func _on_Resume_pressed() -> void:
	pause_toggle()


func pause_toggle() -> void:
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	$Panel.visible = new_pause_state
	resume_btn.visible = new_pause_state
	exit_btn.visible = new_pause_state
	restart_btn.visible = new_pause_state
	$CurrentScoreInfo.visible = new_pause_state


func _on_ExitBtn_pressed() -> void:
	pause_toggle()
	if get_tree().change_scene("res://interface/MainMenu.tscn") != OK:
		print("Fail to load scene MainMenu.")


func _on_RestartBtn_pressed() -> void:
	pause_toggle()
	get_tree().reload_current_scene()
