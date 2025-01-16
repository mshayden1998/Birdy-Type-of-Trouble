extends Control


func _on_Player_scored(current_score) -> void:
	$CurrentScore.text = String(current_score)
