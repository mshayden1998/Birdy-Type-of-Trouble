extends Node

export (PackedScene) var Pipe = preload("res://elements/Pipes.tscn")
onready var ss = get_viewport().get_visible_rect().size
const ERROR_MARGIN = 30
const VISUAL_LIMIT = 220


func _ready():
	# Initiates the intro anim
	$AnimationPlayer.play("bird_reveal")
	
	# Settings stuff
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load("user://game_settings.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		return

	# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		var difficulty = config.get_value(player, "difficulty")
		print(difficulty)
		$PipeSpawnner.wait_time = difficulty


func _on_PipeSpawnner_timeout():
	var p = Pipe.instance()
	p.position = Vector2(
		ss.x + ERROR_MARGIN,
		rand_range(VISUAL_LIMIT, ss.y - VISUAL_LIMIT)
	)
	p.player = get_node("Player")
	$PipeSpawnner.add_child(p)


func _on_AnimationPlayer_animation_finished(_anim_name):
	$Player.set_physics_process(true)


func _on_Player_hit():
	$PipeSpawnner.stop()
	$Player.set_physics_process(false)
	var current_pipes = $PipeSpawnner.get_children()
	for p in current_pipes:
		p.set_process(false)
	yield(get_tree().create_timer(3), "timeout")
	set_best_score($Player.current_score)
	if get_tree().change_scene("res://interface/GameOverScreen.tscn") != OK:
		print("An unexpected error occured when trying to load GameOverScreen scene")


func set_best_score(best_score : int):
	var save_file = File.new()
	save_file.open("user://save_game.dat", File.WRITE)
	save_file.store_string(str(best_score))
	save_file.close()
