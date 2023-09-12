extends Control

func _ready():
	$VBoxContainer/MenuOptions/Restart.grab_focus()

func _on_Restart_pressed():
	get_tree().reload_current_scene()

func _on_Quit_pressed():
	get_tree().quit()

func _on_ToMenu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
