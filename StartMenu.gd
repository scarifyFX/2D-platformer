extends Control

export var Level0 = ""



func _on_Start_button_down():
	get_tree().change_scene(Level0)
	Global.life = 3



func _on_Quit_button_down():
	get_tree().quit()
