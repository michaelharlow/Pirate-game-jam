extends Node2D

@onready var point_light_2d := $PointLight2D
@onready var line_a := $LineA
@onready var line_b := $LineB
@onready var line_c := $LineC
@onready var test_box := get_tree().get_first_node_in_group("boxes")

var follow : bool = true


func _input(event) -> void:
	if event.is_action_pressed("Right_Mouse"):
		follow = !follow
	
	if event.is_action_pressed("Left_Mouse"):
		for box in get_tree().get_nodes_in_group("boxes"):
			print(box.get_name()," > ",round(box.shadow.skew),"° > A: ",round(box.position.y - point_light_2d.position.y)," > B: ",round(box.position.x - point_light_2d.position.x))
			print("Box: ",box.position)
			print("Light: ", point_light_2d.position)
		print("\n")
	
	if event is InputEventMouseMotion:
		for box in get_tree().get_nodes_in_group("boxes"):
			box.shadow.scale.y = (box.position.y - point_light_2d.position.y) * 0.002
			var side_b : float = box.position.x - point_light_2d.position.x
			var side_a : float = box.position.y - point_light_2d.position.y 
			
			
			box.shadow.skew = atan(side_b / side_a) * -1
		
		if follow:
			point_light_2d.position = get_global_mouse_position()
			line_a.set_point_position(0,test_box.position)
			line_a.set_point_position(1,Vector2(test_box.position.x,get_global_mouse_position().y))
			line_b.set_point_position(0,Vector2(test_box.position.x,get_global_mouse_position().y))
			line_b.set_point_position(1,get_global_mouse_position())
			line_c.set_point_position(0,test_box.position)
			line_c.set_point_position(1,get_global_mouse_position())
