extends Node2D

@onready var eyeball = $Eye1
@onready var eyeball_2 = $Eye2


func _input(event):
	if event is InputEventMouseMotion:
		for i in get_children():
			var side_b : float = global_position.x - get_global_mouse_position().x
			var side_a : float = global_position.y - get_global_mouse_position().y
			
			i.rotation = atan2(side_a, side_b) + 90
