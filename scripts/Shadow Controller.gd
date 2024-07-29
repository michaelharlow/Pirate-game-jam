extends Node

@onready var point_light_2d := $PointLight2D
@onready var player := $AlchemistPlayer

var follow : bool = true

func _input(event) -> void:	
	if event.is_action_pressed("Left_Mouse"):
		for box in get_tree().get_nodes_in_group("shadows"):
			if box.mouse_hovered:
				player.moveTo(event.position)

func _process(delta: float) -> void:
	for shadow in get_tree().get_nodes_in_group("shadows"):
		shadow.scale.y = -(shadow.get_parent().position.y - point_light_2d.position.y) * 0.002
		var side_b : float = shadow.get_parent().position.x - point_light_2d.position.x
		var side_a : float = shadow.get_parent().position.y - point_light_2d.position.y 
		
		
		shadow.skew = atan(side_b / side_a) * -1
