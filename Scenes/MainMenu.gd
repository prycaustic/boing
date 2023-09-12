extends Control

func _ready():
	get_tree().paused = false
	$VBoxContainer/MenuOptions/Start.grab_focus()

func _on_Start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")

func _on_Quit_pressed():
	get_tree().quit()
