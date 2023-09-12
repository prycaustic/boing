extends Node

signal game_over()
signal successful_bounce()

@export var game_over = false

func _ready():
	connect("game_over", Callable(self, "_on_game_over"))
	
func _on_game_over():
	game_over = true
