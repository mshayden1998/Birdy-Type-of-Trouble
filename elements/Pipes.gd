extends Area2D

var player : Object
const MARGIN = 100
const SPEED = 350


func _process(delta):
	# Moves the pipe to the left.
	position.x -= SPEED * delta
	# Destroys the pipe if it's out of boundaries.
	if position.x < -MARGIN:
		queue_free()


func _on_Pipes_body_entered(_body):
	player.hit()


func _on_ScoreArea_body_entered(_body):
	player.score()
