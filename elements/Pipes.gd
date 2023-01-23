extends Area2D

var player : Object
const MARGIN = 30


func _process(delta):
	position.x -= 200 * delta
	if position.x < -MARGIN:
		queue_free()


func _on_Pipes_body_entered(_body):
	player.hit()


func _on_ScoreArea_body_entered(_body):
	player.score()
