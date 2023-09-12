extends CharacterBody2D

@export var gravity: float = 750

var velocity: Vector2
var flips = 0
var flip_speed = 0

func _physics_process(delta):
	velocity.y += gravity * delta
	
	var collision = move_and_collide(velocity * delta, false)
	
	if collision:
		# Bounce off walls
		if collision.collider.is_in_group("Wall"):
			velocity.y = min(-(velocity.y / randf_range(1, 2)), 0)
			velocity.x *= -1.5
		
		# Only interacting with the bouncy part of trampoline
		if !collision.collider_shape.is_in_group("Bouncy"): return
		
		# Bounce upwards a random amount
		var jump_impulse = randf_range(-700, -400)
		flips = floor(-jump_impulse / 230)
		flip_speed = flips
		
		velocity.y = jump_impulse
		
		# Distance from the center of the trampoline
		var offset = collision.collider.position.x - position.x
		
		# Bounce sideways a random amount but also influenced by the offset
		velocity.x = randf_range(-300, 300) + offset * randf_range(0.33, 0.67)
		
		# Increase the score
		Events.emit_signal("successful_bounce")
		
	# Flips in the air... honestly idk how it works just kinda fucked around
	$Sprite2D.rotation_degrees += flip_speed * 360 * sign(velocity.x) * delta
	
	if $Sprite2D.rotation_degrees >= 360 or $Sprite2D.rotation_degrees <= -360:
		$Sprite2D.rotation_degrees = 0
		flips -= 1
		
	if flips == 0:
		flip_speed = 0

	if position.y > 690:
		$Fall.play()
		$BigHit.play()
		Events.emit_signal("game_over")
		position.y += 20
		$Sprite2D.rotation_degrees = 90 if sign(velocity.x) > 0 else -90
