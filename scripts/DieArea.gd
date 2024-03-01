extends Area2D

export var scenePath = ""
export var gameOverPath = ""


func _on_DieArea_body_entered(body):
	

	
	if body.name == "player":
		if Global.life > 0:
			Global.life -= 1
			get_tree().change_scene(scenePath)
			
		if Global.life == 0:
			get_tree().change_scene(gameOverPath)
		
