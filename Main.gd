extends Node

export (PackedScene) var Pipe = preload("res://elements/Pipes.tscn")
onready var ss = get_viewport().get_visible_rect().size
onready var pipe_spawn = $PipeSpawnner
const ERROR_MARGIN = 80
const VISUAL_LIMIT = 220


func _ready():
	# Initiates the intro anim.
	$AnimationPlayer.play("bird_reveal")
	$InterfaceLayer.visible = true


func _on_PipeSpawnner_timeout():
	# Spawns a new pipe every timeout.
	var p = Pipe.instance()
	p.position = Vector2(
		ss.x + ERROR_MARGIN,
		rand_range(VISUAL_LIMIT, ss.y - VISUAL_LIMIT)
	)
	p.player = get_node("Player")
	pipe_spawn.add_child(p)


func _on_AnimationPlayer_animation_finished(_anim_name):
	# After intro animation ends, player takes the action.
	$Player.set_physics_process(true)


func _on_Player_hit():
	pipe_spawn.stop()
	# Gets player object and stops player's control.
	var player = $Player
	player.set_physics_process(false)
	# Gets all the pipes and stops then.
	var current_pipes = pipe_spawn.get_children()
	for p in current_pipes:
		p.set_process(false)
	# Waits three seconds to change to GameOverScreen
	yield(get_tree().create_timer(3), "timeout")
	# Set player's new best score (if necessary)
	if player.current_score > Global.load_best_score():
		Global.save_best_score(player.current_score)
	else:
		pass
	if get_tree().change_scene("res://interface/GameOverScreen.tscn") != OK:
		print("An unexpected error occured when trying to load GameOverScreen scene")
