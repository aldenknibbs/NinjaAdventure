extends CharacterBody2D

class_name  Player

# Declare variables
@export var speed: int = 50
@onready var animations = $AnimationPlayer

# Hanle input
func handle_input():
	var moveDirection = Input.get_vector("Left", "Right" ,"Up", "Down")
	velocity = moveDirection * speed

func update_animation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		elif velocity.y > 0: direction = 'Down'
	
		animations.play("walk" + direction)

func _physics_process(delta):
	handle_input()
	update_animation()
	move_and_slide()
