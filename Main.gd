extends Node

export (PackedScene) var Pipe = preload("res://elements/Pipes.tscn")
onready var ss = get_viewport().get_visible_rect().size
const ERROR_MARGIN = 30
const VISUAL_LIMIT = 220


func _ready():
	# Initiates the intro anim.
	$AnimationPlayer.play("bird_reveal")


func _on_PipeSpawnner_timeout():
	# Spawns a new pipe every timeout.
	var p = Pipe.instance()
	p.position = Vector2(
		ss.x + ERROR_MARGIN,
		rand_range(VISUAL_LIMIT, ss.y - VISUAL_LIMIT)
	)
	p.player = get_node("Player")
	$PipeSpawnner.add_child(p)


func _on_AnimationPlayer_animation_finished(_anim_name):
	# After intro animation ends, player takes the action.
	$Player.set_physics_process(true)


func _on_Player_hit():
	$PipeSpawnner.stop()
	# Gets player object and stops player's control.
	var player = $Player
	player.set_physics_process(false)
	# Gets all the pipes and stops then.
	var current_pipes = $PipeSpawnner.get_children()
	for p in current_pipes:
		p.set_process(false)
	# Waits three seconds to change to GameOverScreen
	yield(get_tree().create_timer(3), "timeout")
	set_best_score(player.current_score)
	if get_tree().change_scene("res://interface/GameOverScreen.tscn") != OK:
		print("An unexpected error occured when trying to load GameOverScreen scene")


func set_best_score(current_score : int):
	var save_file = File.new()
	var best_score = save_file.open("user://save_game.dat", File.READ)
	if best_score < current_score:
		save_file.open("user://save_game.dat", File.WRITE)
		best_score = current_score
		save_file.store_string(str(best_score))
	save_file.close()
