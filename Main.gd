extends Node

export (PackedScene) var Pipes: PackedScene
onready var player: KinematicBody2D = $Player
onready var ss: Vector2 = get_viewport().get_visible_rect().size
onready var pipe_spawn: Timer = $PipeSpawnner
const ERROR_MARGIN:int = 80
const VISUAL_LIMIT:int = 220


func _ready() -> void:
	# Initiates the intro anim.
	$AnimationPlayer.play("bird_reveal")
	$InterfaceLayer.visible = true


func _on_PipeSpawnner_timeout() -> void:
	# Spawns a new pipe every timeout.
	var p = Pipes.instance()
	p.position = Vector2(
		ss.x + ERROR_MARGIN,
		rand_range(VISUAL_LIMIT, ss.y - VISUAL_LIMIT)
	)
	pipe_spawn.add_child(p)


func _on_AnimationPlayer_animation_finished(_anim_name) -> void:
	# After intro animation ends, player takes the action.
	player.set_physics_process(true)


func _on_Player_hit() -> void:
	pipe_spawn.stop()
	# Gets player object and stops player's control.
	player.set_physics_process(false)
	# Gets all the pipes and stops then.
	var current_pipes = pipe_spawn.get_children()
	for p in current_pipes:
		p.set_process(false)
	# Waits three seconds to change to GameOverScreen
	yield(get_tree().create_timer(3), "timeout")
	# Show game over screen.
	if get_tree().change_scene("res://interface/GameOverScreen.tscn") != OK:
		print("An unexpected error occured when trying to load GameOverScreen scene")
