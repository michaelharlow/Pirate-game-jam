extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var change_direction_timer = $ChangeDirectionTimer
@onready var shadow = $Shadow

@export var speed: float = 400.0
@export var acceleration: float = 10.0
@export var flip_speed : float = 15

var direction : Vector2 = Vector2(0.5,0.5)

func _ready() -> void:
	pass


func _physics_process(delta):
	# Handle Movement
	velocity.x = move_toward(velocity.x, speed * direction.x, acceleration * delta * 100)
	velocity.y = move_toward(velocity.y, speed * direction.y, acceleration * delta * 100)
	
	if direction.x < 0:
		sprite_2d.scale.x = lerp(sprite_2d.scale.x, -0.25, delta * flip_speed)
		shadow.flip_h = true
	else:
		sprite_2d.scale.x = lerp(sprite_2d.scale.x, 0.25, delta * flip_speed)
		shadow.flip_h = false
	
	move_and_slide()


func _on_change_direction_timer_timeout():
	direction = Vector2(randf_range(-1,1),randf_range(-1,1))
