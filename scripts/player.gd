extends KinematicBody2D

var up = Vector2(0, -1) #test, talar vad som är upp
var gravity = 9.8
var MaxFallSpeed = 200
var speed = 100
var playerStartPos = Vector2()
var jumpforce = 300
var accel = 10
var friction = 0.2
export var gameOverPath = ""


var motion = Vector2() #Är x och Y koordinater

func _ready():
	playerStartPos = position

func _physics_process(_delta): 
	
	motion.y += gravity
	motion.x = clamp(motion.x,-speed,speed)
	
	if Global.KillSignal == true:
		position = playerStartPos
		Global.life -= 1
		Global.KillSignal = false
		get_tree().reload_current_scene()
	if Global.life == 0:
			get_tree().change_scene(gameOverPath)
	
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed
		
	if Input.is_action_pressed("Right"):
		motion.x += accel
		$Sprite.scale.x = 1
		
		$MarioAnimation.play("run")
		
	elif Input.is_action_pressed("Left"):
		motion.x -= accel
		$Sprite.scale.x = -1
		
		$MarioAnimation.play("run")
		
	else:
		$MarioAnimation.stop()
		$Sprite.frame = 0
		motion.x = lerp(motion.x, 0, friction)
	
	motion = move_and_slide(motion, up)
	
	if is_on_floor():
		#$Sprite.frame = 0
		if Input.is_action_pressed("Jump"):
			motion.y = -jumpforce
			$Sprite.frame = 5
			
			$JumpSound.play(0.14)
			
	if !is_on_floor():
		$MarioAnimation.stop()
		$Sprite.frame = 5
	
	if Input.is_action_just_pressed("respawn"):
		position = playerStartPos
