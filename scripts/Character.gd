extends CharacterBody2D


@export var speed: float = 600.0
@export var acceleration: float = 20.0
@export var shadow_info: Resource

func _physics_process(delta):
	# Handle Movement
	var direction = Input.get_vector("Left","Right","Up","Down")
	
	velocity.x = move_toward(velocity.x, speed * direction.x, acceleration * delta * 100)
	velocity.y = move_toward(velocity.y, speed * direction.y, acceleration * delta * 100)
	
	move_and_slide()
