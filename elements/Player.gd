extends KinematicBody2D

var velocity := Vector2.ZERO
var current_score := 0
const IMPULSE := 1000
const GRAVITY := 50

signal scored(current_score)


func _ready():
	set_physics_process(false)


func _physics_process(_delta):
	# applies gravity
	velocity.y += GRAVITY
	# player's input
	get_input()
	velocity = move_and_slide(velocity)


func _input(event):
	if event is InputEventScreenTouch:
		print("touched anywere!")
		get_parent().get_node("TestSprite").visible = true


func get_input():
	# not only gets player's input but limits it if the character is above the sky
	if position.y > 0 and Input.is_action_just_pressed("player_up"):
		velocity.y = 0
		velocity.y -= IMPULSE
		$FlapSFX.play()


func score():
	current_score += 1
	emit_signal("scored", current_score)
	$ScoreSFX.play()


func hit():
	$HitSFX.play()
