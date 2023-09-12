extends Node2D

const GameOver = preload("res://Scenes/GameOver.tscn")

func _ready():
	get_tree().paused = false
	Events.connect("game_over", Callable(self, "_on_game_over"))
	
func _on_game_over():
	var game_over_screen = GameOver.instantiate()
	
	get_tree().paused = true
	await get_tree().create_timer(1).timeout
	add_child(game_over_screen)
