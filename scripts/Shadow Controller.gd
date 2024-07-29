extends Node2D

@onready var point_light_2d := $PointLight2D
@onready var test_box := get_tree().get_first_node_in_group("boxes")
@onready var player := $AlchemistPlayer

var follow : bool = true


func _input(event) -> void:
	if event.is_action_pressed("Right_Mouse"):
		follow = !follow
	
	if event.is_action_pressed("Left_Mouse"):
		for box in get_tree().get_nodes_in_group("boxes"):
			if box.mouse_hovered:
				player.position = event.position
	
	if event is InputEventMouseMotion:
		for box in get_tree().get_nodes_in_group("boxes"):
			box.shadow.scale.y = (box.position.y - point_light_2d.position.y) * 0.002
			var side_b : float = box.position.x - point_light_2d.position.x
			var side_a : float = box.position.y - point_light_2d.position.y 
			
			
			box.shadow.skew = atan(side_b / side_a) * -1
		
		if follow:
			point_light_2d.position = get_global_mouse_position()
