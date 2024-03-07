extends Control

export var StartMenu = ""



func _on_Start_button_down():
	get_tree().change_scene(StartMenu)



func _on_Quit_button_down():
	get_tree().quit()
