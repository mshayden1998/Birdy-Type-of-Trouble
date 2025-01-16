extends Area2D

const MARGIN: int = 100
const SPEED: int = 350


func _process(delta: float) -> void:
	# Moves the pipe to the left.
	position.x -= SPEED * delta
	# Destroys the pipe if it's out of boundaries.
	if position.x < -MARGIN:
		queue_free()


func _on_Pipes_body_entered(body) -> void:
	body.hit()


func _on_ScoreArea_body_entered(body) -> void:
	body.score()
