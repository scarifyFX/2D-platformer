extends KinematicBody2D

var up = Vector2(0, -1) #test, talar vad som är upp
var gravity = 15
var MaxFallSpeed = 250
export var speed = 50

var motion = Vector2()
var playerStartPos = Vector2()

var MovingLeft = true
var maxMoveDistance = 100

func _ready():
	playerStartPos = position
func _physics_process(_delta): 
	
	motion.y += gravity
	motion.x = clamp(motion.x,-speed,speed)
	
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed
		
	if MovingLeft == true:
		motion.x = -speed
		$Sprite.scale.x = 1
		
		$EnemyAnimation.play("EnemyAnimation")
		
	else:
		motion.x = speed
		$Sprite.scale.x = -1
		
		$EnemyAnimation.play("EnemyAnimation")
		
			
	if position.x >= playerStartPos.x:
		MovingLeft = true
	elif position.x <= playerStartPos.x - maxMoveDistance:
			MovingLeft = false
				
	motion = move_and_slide(motion, up)







func _on_Die_body_entered(body):
	
	if body.name == "player":
		queue_free()
		
		
func _on_Attack_body_entered(body):
	if body.name == "player":
		print ("kill player")
		Global.KillSignal = true
		get_tree().reload_current_scene()
		
