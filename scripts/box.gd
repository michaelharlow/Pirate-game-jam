extends RigidBody2D

@onready var shadow = $Shadow
@onready var shadow_area = $Shadow/ShadowArea

@export var shadow_info: ShadowInfo

var mouse_hovered : bool = false

func _ready() -> void:
	add_to_group("boxes")
	
	#Connecting Area2D Signals
	shadow_area.mouse_entered.connect(_on_shadow_area_mouse_entered)
	shadow_area.mouse_exited.connect(_on_shadow_area_mouse_exited)

func _input(event) -> void:
	if event is InputEventMouseButton and mouse_hovered:
		print("Shadows")


func _on_shadow_area_mouse_entered() -> void:
	mouse_hovered = true
	print("Mouse entered at ", position)


func _on_shadow_area_mouse_exited():
	mouse_hovered = false
	print("Mouse exited at", position)
