extends CenterContainer

func _on_Interface_score_changed(score):
	$Number.text = str(score)
