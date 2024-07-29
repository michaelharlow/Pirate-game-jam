extends Node

@onready var point_light_2d := $PointLight2D
@onready var player := $AlchemistPlayer

var follow : bool = true
@export var shadow_length : float = 0.001

func _input(event) -> void:
	if event.is_action_pressed("Left_Mouse"):
		for object in get_tree().get_nodes_in_group("shadows"):
			print(object)
			if object.shadow.mouse_hovered:
				player.moveTo(event.position)

func _process(_delta: float) -> void:
	for object in get_tree().get_nodes_in_group("shadows"):
		object.shadow.scale.y = (object.position.y - point_light_2d.position.y) * shadow_length
		var side_b : float = object.position.x - point_light_2d.position.x
		var side_a : float = object.position.y - point_light_2d.position.y 
		
		
		object.shadow.skew = atan(side_b / side_a) * -1
