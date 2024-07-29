extends CharacterBody2D

@onready var hand = $Hand
@onready var hand_collision = $CollisionShapeHand

var target: Vector2 = position
var sprite_offset : float = -156
var mouse_distance : float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_distance > abs(sprite_offset * 2):
		position.x = lerp(global_position.x, get_global_mouse_position().x, delta * 1)
		position.y = lerp(global_position.y, get_global_mouse_position().y, delta * 1)


func _physics_process(_delta):
	if position.distance_to(target) > 1:
		# Move towards target starting slowly and speeding up then slowing down at the end using interpolation
		#position = position.lerp(target, clamp(2 * delta, 0, 1))
		pass

func moveTo(target_vector: Vector2):
	self.target = target_vector


func _input(event):
	
	# Manipulate Hand object in relation to eyes and mouse position
	if event is InputEventMouseMotion:
		hand.rotation = (get_global_mouse_position() - position).angle() + 90
		
		mouse_distance = get_global_mouse_position().distance_to(position)
		var unsheath_progress : float = clamp(-1 * mouse_distance, sprite_offset, 0)
		hand.offset.y = unsheath_progress
		hand.scale.x = unsheath_progress * (1 / sprite_offset)
		hand.scale.y = hand.scale.x
		
		if unsheath_progress > sprite_offset / 1.8:
			hand.visible = false
		else:
			hand.visible = true
		
		if get_global_mouse_position().x > global_position.x:
			hand.flip_h = true
		else:
			hand.flip_h = false
		
		hand_collision.scale = hand.scale
		hand_collision.disabled = !hand.visible
