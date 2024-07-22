extends Node2D

@onready var point_light_2d = $PointLight2D

var num := 1

func _process(_delta) -> void:
	point_light_2d.position = get_global_mouse_position()
	for box in get_tree().get_nodes_in_group("boxes"):
		box.shadow.scale.y = (box.position.y - point_light_2d.position.y) * 0.01
		box.shadow.skew = (box.position.x - point_light_2d.position.x) * -0.001
