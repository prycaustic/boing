extends CharacterBody2D

func _ready():
	Events.connect("successful_bounce", Callable(self, "_on_successful_bounce"))
	
func _on_successful_bounce():
	$AnimatedSprite2D.play("bounce")
	$BounceSound.play()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite2D.animation != "idle":
		$AnimatedSprite2D.play("idle")
