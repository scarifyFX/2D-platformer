extends Area2D


export var NextLevel = ("")




func _on_NextLevel_body_entered(body):
	
	if body.name == "player":
		get_tree().change_scene(NextLevel)
