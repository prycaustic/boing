extends Control

signal score_changed(score)

func _on_Score_score_changed(score):
	emit_signal("score_changed", score)
