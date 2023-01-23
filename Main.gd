extends Node

export (PackedScene) var Pipe = preload("res://elements/Pipes.tscn")
onready var ss = get_viewport().get_visible_rect().size
const ERROR_MARGIN = 30
const VISUAL_LIMIT = 15


func _ready():
	$AnimationPlayer.play("bird_reveal")
	$TestSprite.visible = false


func _on_PipeSpawnner_timeout():
	var p = Pipe.instance()
	p.position = Vector2(
		ss.x + ERROR_MARGIN,
		rand_range(VISUAL_LIMIT, ss.y - VISUAL_LIMIT)
	)
	p.player = get_node("Player")
	add_child(p)


func _on_AnimationPlayer_animation_finished(_anim_name):
	$Player.set_physics_process(true)
