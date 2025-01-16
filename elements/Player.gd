extends KinematicBody2D

var velocity: Vector2 = Vector2.ZERO
var current_score: int = 0
const IMPULSE: int = 1300
const GRAVITY: int = 50

signal scored(current_score)
signal hit


func _ready() -> void:
	# Prevents player's control before intro anim ends.
	set_physics_process(false)


func _physics_process(_delta: float) -> void:
	# applies gravity
	velocity.y += GRAVITY
	# player's input
	flap(false)
	velocity = move_and_slide(velocity)


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		flap(true)


func flap(touch: bool) -> void:
	# not only gets player's input but limits it if the character is above the sky
	if position.y > 0:
		if Input.is_action_just_pressed("player_up") or touch == true:
			velocity.y = 0
			velocity.y -= IMPULSE
			$FlapSFX.play()
	if position.y > get_viewport_rect().size.y:
		hit()


func score() -> void:
	current_score += 1
	emit_signal("scored", current_score)
	$ScoreSFX.play()


func hit() -> void:
	$HitSFX.play()
	emit_signal("hit")
