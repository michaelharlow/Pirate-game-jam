extends Node2D

@onready var eyeball = $Eyeball
@onready var eyeball_2 = $Eyeball2


func _input(event):
	if event is InputEventMouseMotion:
		for i in get_children():
			var side_b : float = position.x - get_global_mouse_position().x
			var side_a : float = position.y - get_global_mouse_position().y
			
			i.rotation = atan2(side_a, side_b) + 90
