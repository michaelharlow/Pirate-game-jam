extends CharacterBody2D

var target: Vector2 = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	if position.distance_to(target) > 1:
		# move towards target starting slowly and speeding up then slowing down at the end using interpolation
		position = position.lerp(target, clamp(2 * delta, 0, 1))
		
func moveTo(target: Vector2):
	self.target = target
