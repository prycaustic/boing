extends Node

signal score_changed(score)

var score = 0

func _ready():
	Events.connect("successful_bounce", Callable(self, "_on_successful_bounce"))
	
func _on_successful_bounce():
	score += 1
	emit_signal("score_changed", score)

	# Play sound effect
	if score % 10 == 0 and randf() > 0.5:
		$Woohoo.play()
