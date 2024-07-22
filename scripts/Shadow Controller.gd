extends Node2D

@onready var point_light_2d = $PointLight2D

func _process(_delta) -> void:
	for box in get_tree().get_nodes_in_group("boxes"):
		box.shadow.scale.y = (box.position.y - point_light_2d.position.y) * 0.0003
		
		var delta_x = point_light_2d.position.x - box.position.x
		var delta_y = point_light_2d.position.y - box.position.y


func _input(event) -> void:
	if event.is_action_pressed("Left_Mouse"):
		point_light_2d.position = get_global_mouse_position()
