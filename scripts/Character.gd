extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var change_direction_timer = $ChangeDirectionTimer

@export var speed: float = 600.0
@export var acceleration: float = 20.0
@export var shadow_info: Resource

var direction : Vector2 = Vector2.ZERO

func _physics_process(delta):
	# Handle Movement
	velocity.x = move_toward(velocity.x, speed * direction.x, acceleration * delta * 100)
	velocity.y = move_toward(velocity.y, speed * direction.y, acceleration * delta * 100)
	
	if direction.x < 0:
		sprite_2d.scale.x = -0.25
	else:
		sprite_2d.scale.x = 0.25
	
	move_and_slide()


func _on_change_direction_timer_timeout():
	direction = Vector2(randf_range(-1,1),randf_range(-1,1))
