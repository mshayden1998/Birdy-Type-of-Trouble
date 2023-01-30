extends KinematicBody2D

var velocity := Vector2.ZERO
var current_score := 0
const IMPULSE := 1300
const GRAVITY := 50

signal scored(current_score)
signal hit


func _ready():
	# Prevents player's control before intro anim ends.
	set_physics_process(false)


func _physics_process(_delta):
	# applies gravity
	velocity.y += GRAVITY
	# player's input
	flap(false)
	velocity = move_and_slide(velocity)


func _input(event):
	if event is InputEventScreenTouch:
		flap(true)


func flap(touch: bool):
	# not only gets player's input but limits it if the character is above the sky
	if position.y > 0:
		if Input.is_action_just_pressed("player_up") or touch == true:
			velocity.y = 0
			velocity.y -= IMPULSE
			$FlapSFX.play()
	if position.y > get_viewport_rect().size.y:
		hit()


func score():
	current_score += 1
	emit_signal("scored", current_score)
	$ScoreSFX.play()


func hit():
	$HitSFX.play()
	emit_signal("hit")
