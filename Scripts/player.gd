extends CharacterBody2D

class_name  Player

# Declare variables
@export var speed: int = 50

# Hanle input
func handle_input():
	var moveDirection = Input.get_vector("Left", "Right" ,"Up", "Down")
	velocity = moveDirection * speed

func _physics_process(delta):
	handle_input()
	move_and_slide()
